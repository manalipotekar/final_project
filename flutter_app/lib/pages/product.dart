import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/components/custom_button.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/pages/checkout.dart';
import 'package:flutter_app/utils/application_state.dart';
import 'package:flutter_app/utils/custom_theme.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:flutter_app/utils/firestore.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({required this.product, super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool addButtonLoad = false;
  void addDataToF(UserCredential userCredential) {}



  @override
  Widget build(BuildContext context) {
    // print( Provider.of<ApplicationState>(context, listen: false).user);
    

  void onAddToCart() async {
    setState(() {
      addButtonLoad = true;
    });
    print("this is user ");
    Consumer<ApplicationState>(builder: ((context, value1, child) => SizedBox( child:Text(value1.user.toString())

      ))
      
      );
  
    print( Provider.of<ApplicationState>(context, listen: false).user);
    // Provider.of<ApplicationState>(context,listen: false).user;
    print("//");
    await FirestoreUtil.addToCart(
        Provider.of<ApplicationState>(context, listen: false).user,
        widget.product.id);

    // print( ApplicationState().user );

    setState(() {
      addButtonLoad = false;
    });
  }

    return 
     Consumer<ApplicationState>(
          builder: (context, value1, child) => 
    Scaffold(
          body: SafeArea(
        child:
           Stack(children: [
            SingleChildScrollView(
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        
                          height: 500,
                          width: double.infinity,
                        //    child: Image.asset("assets/f5.jpeg",
                        //  fit: BoxFit.contain,
                        // ),
                          child: CachedNetworkImage(
                            imageUrl: widget.product.image,
                          )
                          ),
                      Positioned(
                        top: 35,
                        right: 35,
                        child: Container(
                          padding: EdgeInsets.all(12),
                            decoration: ShapeDecoration(
                                color: CustomTheme.yellow,
                                shape: CircleBorder(),
                                shadows: CustomTheme.cardShadow),
                                child: GestureDetector(
                                  child:Icon(Icons.shopping_cart) ,
                                   onTap: (){
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>CheckoutScreen())
                                        );
                                      },
                                ),
                            // child: IconButton(
                            //   icon: const Icon(Icons.shopping_cart_checkout),
                            //   color: Colors.black,
                            //   onPressed: () {
                            //             Navigator.push(context,MaterialPageRoute(builder: (context)=>CheckoutScreen())
                            //             );
                            //   },
                            // )
                            
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DefaultTextStyle(
                        style: Theme.of(context).textTheme.headlineMedium!,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 20),
                                // child: Text("Rice"),
child: Text(widget.product.title),
                                // child: Text(value1.user?.uid as String)
                                
                                ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  children: [
                                    // Text("MRP 200"),
                                    Text("Rs " + widget.product.price.toString())
                                  ],
                                )),
                            CustomButton(
                              
                                text: "Add to Cart",
                               
                                onPress: onAddToCart,
                                loading: addButtonLoad),
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[200]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Text(
                                      
                                      "About the item",
                                      style: Theme.of(context).textTheme.headline6!,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Text(
                                      widget.product.description,
                                      style: Theme.of(context).textTheme.headline6!,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(

                              padding: EdgeInsets.all(7),
child: ElevatedButton(child: Text("Call"), onPressed: () {
  // FlutterPhoneDirectCaller.callNumber('9881719446');
  // launch('tel:+9881719');
},),
// Text("Contact Supplier",
                                // style:TextStyle(color: Colors.black,fontSize: 28)
                            
                              
                            ),
                            
                            Container(
                              width: double.infinity,
                                 margin: EdgeInsets.only( bottom: 15),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green[100]),
                              child: Text("091450 63875",
                                style: Theme.of(context).textTheme.headline6!,
                              ),),
                                Container(
                              width: double.infinity,
                                 margin: EdgeInsets.only( bottom: 15),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red[100]),
                              child: Text("goanfarmersmarket@gmail.com",
                                style: Theme.of(context).textTheme.headline6!,
                              ),),

                              Container(
                                width: double.infinity,
                                 margin: EdgeInsets.only( bottom: 15),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[100]),
                                child: Text("House No 61/A, 1st Daddio, Navelim, India, Goa",
                                  style: Theme.of(context).textTheme.headline6!,
                                ),
                              )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 35,
                left: 30,
                child: Container(
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      icon: Icon(Icons.arrow_back)),
                )),
          ]),
        ),
      ),
    );
  }
}
