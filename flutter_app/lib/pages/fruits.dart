import 'package:flutter/material.dart';
import 'package:flutter_app/components/grid_card.dart';
import 'package:flutter_app/components/loader.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/pages/product.dart';
import 'package:flutter_app/utils/firestore.dart';

class FruitsScreen extends StatefulWidget {
  const FruitsScreen({super.key});

  @override
  State<FruitsScreen> createState() => _FruitsScreenState();
}

class _FruitsScreenState extends State<FruitsScreen> {
  final data = ["1", "2"];
  Future<List<Product>>? products;

  @override
  void initState() {
    super.initState();
    products = FirestoreUtil.getFruits([
      
    ]);
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
            return Scaffold(

                     appBar: AppBar(
           title: const Text("",textAlign: TextAlign.start, style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,),),
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 96, 212, 100),
            toolbarHeight: 70,
          ),
              
              body: Container(

                child: Column(
                  children: [
                    Container(
                      margin:const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: const Color.fromARGB(255, 230, 230, 230),
                      // border: Border.all()
                      ),
                      child: TextFormField(
                        // cursorHeight: 0,cursorWidth: 0,

                        enableInteractiveSelection: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.search,color: Color.fromARGB(255, 143, 143, 143),),fillColor: Colors.grey,
              border: InputBorder.none,
              
              hintText: 'Search',
              
            ),),),

                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          
                          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          //     crossAxisCount: 2,mainAxisSpacing: 0,crossAxisSpacing: 0),
                          itemBuilder: (BuildContext context, int index) {
                            return GridCard(
                              product:snapshot.data![index],
                                index: index,
                                onPress: () {
                                  onCardPress(snapshot.data![index]);
                                });
                          }
                          
                          ),
                    ),
                  ],
                ),
              ),
            );
          }
          else{
            return const Center(child: loader());
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
