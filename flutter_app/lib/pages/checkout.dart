import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_button.dart';
import 'package:flutter_app/components/list_card.dart';
import 'package:flutter_app/components/loader.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:flutter_app/pages/product.dart';
import 'package:flutter_app/utils/application_state.dart';
import 'package:flutter_app/utils/common.dart';
import 'package:flutter_app/utils/custom_theme.dart';
import 'package:flutter_app/utils/firestore.dart';
// import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:provider/provider.dart';

import 'frontpage.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // final carts = ["1", "2"];
  Future<List<Cart>>? carts;
  bool _checkoutButtonLoading = false;

  @override
  void initState() {
    super.initState();
    carts = FirestoreUtil.getCart(
        Provider.of<ApplicationState>(context, listen: false).user);
  }

  void checkout() async {
    setState(() {
      _checkoutButtonLoading = true;
    });

    String error = await CommonUtil.checkoutFlow(
        Provider.of<ApplicationState>(context, listen: false).user!);
    if (error.isEmpty) {
      CommonUtil.showAlert(context, "Success", "Your Order is placed");
    } else {
      CommonUtil.showAlert(context, "Alert", error);
    }
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _checkoutButtonLoading = false;
      carts = FirestoreUtil.getCart(
          Provider.of<ApplicationState>(context, listen: false).user);
    });
  }

  late Cart c;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Cart>>(
        future: carts,
        builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.isNotEmpty) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.green,
                 leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () { 
            
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => frontPage(),
              ),
            );
          },
        ),

              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          return ListCard(cart: snapshot.data![index]);
                        })),
                    priceFooter(snapshot.data!),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: CustomButton(
                        text: "Checkout",
                        onPress: () async {
                          FirestoreUtil.createOrder(
                              Provider.of<ApplicationState>(context,
                                      listen: false)
                                  .user!);

                          bool result = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Confirmation'),
                                content: const Text('Your Order has been confirmed'),
                                actions: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          //To switch to new screen
                                          context,
                                          MaterialPageRoute(
                                              //route to next page
                                              builder: (context) =>
                                                  const frontPage()));
                                    },
                                    child: const Text('Back'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        //                     FirestoreUtil.createOrder(
                        //                       Provider.of<ApplicationState>(context, listen: false).user,

                        // carts
                        //                     )

                        ,
                        loading: _checkoutButtonLoading,
                      ),
                    ),
              
                  ],
                ),
              ),
            );
          } else if (snapshot.data != null && snapshot.data!.isEmpty) {
            return const Center(
              child: Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.amber,
                size: 150,
              ),
            );
          } else {
            return const Center(
              child: loader(),
            );
          }
        },
      ),
    );
  }

  priceFooter(List<Cart> carts) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            height: 2,
            color: CustomTheme.grey,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Text(
                  "Total: ",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Spacer(),
                Text(
                  "Rs${FirestoreUtil.getCartTotal(carts)}",
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
