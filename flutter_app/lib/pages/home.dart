import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/components/grid_card.dart';
import 'package:flutter_app/components/loader.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/pages/product.dart';
import 'package:flutter_app/utils/firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final data = ["1", "2"];
  Future<List<Product>>? products;

  @override
  void initState() {
    super.initState();
    products = FirestoreUtil.getProducts([]);
  }

  @override
  Widget build(BuildContext context) {
    onCardPress(Product product) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductScreen(product: product,)));
    }

    return 
    FutureBuilder<List<Product>>(
        future: products,
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              
                itemCount: snapshot.data?.length,
                padding: const EdgeInsets.symmetric(vertical: 5),
                // listDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 1,mainAxisSpacing: 0,crossAxisSpacing: 0),
                itemBuilder: (BuildContext context, int index) {
                  return GridCard(

                    product:snapshot.data![index],
                      index: index,
                      onPress: () {
                        onCardPress(snapshot.data![index]);
                      });
                }
                
                );
          }
          else{
            return Center(child: loader());
          }
        });
    // Container(
    //   child:GridView.builder(
    //     itemCount: data.length,
    //     padding: const EdgeInsets.symmetric(vertical: 10),
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,
    //    itemBuilder: (BuildContext context,int index){
    //     return GridCard(index: index, onPress:onCardPress);
    //   })
    // );
  }
}
