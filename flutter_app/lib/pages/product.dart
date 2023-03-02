import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/components/custom_button.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/utils/application_state.dart';
import 'package:flutter_app/utils/custom_theme.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:flutter_app/utils/firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/utils/application_state.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({required this.product, super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool addButtonLoad = false;
   void addDataToF( UserCredential userCredential){
    

   }
  
  void onAddToCart() async {
    
    setState(() {
      addButtonLoad = true;
    });
        print( Provider.of<ApplicationState>(context,listen: false).user );
        // Provider.of<ApplicationState>(context,listen: false).user;
    await FirestoreUtil.addToCart(Provider.of<ApplicationState>(context,listen: false).user ,widget.product.id );
    
        print("inside addtocart2");
    

    setState(() {
      addButtonLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 500,
                    width: double.infinity,
                    child: CachedNetworkImage(imageUrl: widget.product.image,)
                  ),
                  Positioned(
                    top: 35,
                    right: 35,
                    child: Container(
                        decoration: ShapeDecoration(
                            color: CustomTheme.yellow,
                            shape: CircleBorder(),
                            shadows: CustomTheme.cardShadow),
                        child: IconButton(
                          icon: const Icon(Icons.share),
                          color: Colors.black,
                          onPressed: () {},
                        )),
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
                            child: Text(widget.product.title)),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: [Text("MRP"), Text("\$ "+widget.product.price.toString())],
                            )),
                        CustomButton(
                            text: "Add to Cart",
                            onPress: onAddToCart,
                            loading: addButtonLoad),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "About the items",
                            style: Theme.of(context).textTheme.headline4!,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text(
                            widget.product.description,
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
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  icon: Icon(Icons.arrow_back)),
            )),
      ]),
    ));
  }
}
