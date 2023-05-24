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
import 'package:flutter_app/pages/places_screen.dart';
import 'package:flutter_app/pages/single_city.dart';
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

  var firestoreDB = FirebaseFirestore.instance.collection("orders").snapshots();

  final List<Map<String, dynamic>> clityList = const [
    {
      "address": "Jaipur the pink city",
      "id": "jaipur_01",
      "image":
          "https://lh3.googleusercontent.com/p/AF1QipPtZJHTy79HN2RQrqSrp1Fue_HbOK3euvUmqkHp=s1360-w1360-h1020",
      "lat": 15.253806,
      "lng": 73.960091,
      "name": "Goan farmers Market",
      "phone": "7014333352",
      "region": "South Asia"
    },
    {
      "address": "New Delhi capital of india",
      "id": "delhi_02",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoWCVxwek64-fnkk0cUtZri4NwVGB1p17GkMc8Gthx&s",
      "lat": 15.254746476771285,
      "lng": 74.96006318465938,
      "name": "Delhi City India",
      "phone": "7014333352",
      "region": "South Asia"
    },
    {
      "address": "Mumbai City",
      "id": "mumbai_03",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoWCVxwek64-fnkk0cUtZri4NwVGB1p17GkMc8Gthx&s",
      "lat": 15.254746476771285,
      "lng": 73.96006318465938,
      "name": "Mumbai City India",
      "phone": "7014333352",
      "region": "South Asia"
    },
    {
      "address": "Udaipur City",
      "id": "udaipur_04",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoWCVxwek64-fnkk0cUtZri4NwVGB1p17GkMc8Gthx&s",
      "lat": 24.571270,
      "lng": 73.691544,
      "name": "Udaipur City India",
      "phone": "7014333352",
      "region": "South Asia"
    }
  ];

  getDetails(Map singleCityData, BuildContext context) {
    print(singleCityData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SingleCity(
          cityData: singleCityData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print( Provider.of<ApplicationState>(context, listen: false).user);

    void onAddToCart() async {
      setState(() {
        addButtonLoad = true;
      });
      print("this is user ");
      Consumer<ApplicationState>(
          builder: ((context, value1, child) =>
              SizedBox(child: Text(value1.user.toString()))));

      print(Provider.of<ApplicationState>(context, listen: false).user);
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

    return Consumer<ApplicationState>(
      builder: (context, value1, child) => Scaffold(
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
                          //    child: Image.asset("assets/f5.jpeg",
                          //  fit: BoxFit.contain,
                          // ),
                          child: CachedNetworkImage(
                            imageUrl: widget.product.image,
                          )),
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
                            child: Icon(Icons.shopping_cart),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CheckoutScreen()));
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

                              child: Text(widget.product.title),
                              // child: Text(value1.user?.uid as String)
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  children: [
                                    // Text("MRP 200"),
                                    Text(
                                        "Rs " + widget.product.price.toString())
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Text(
                                      widget.product.description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            StreamBuilder(
                                stream: firestoreDB,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData)
                                    return CircularProgressIndicator();
                                  return SingleChildScrollView(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: ((context, int index) {
                                          return SingleChildScrollView(
                                            child: Container(),
                                          );
                                        })),
                                  );
                                }),
                            Container(
                              padding: EdgeInsets.all(7),
                              child:
                           
Text("Contact Supplier",
                              style:TextStyle(color: Colors.black,fontSize: 28))
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 15),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green[100]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "091450 63875",
                                    style: Theme.of(context).textTheme.headline6!,
                                  ),
                                  IconButton(onPressed: (){
                                  launch('tel:+919881719446');
                                  }, icon: Icon(Icons.call),color: const Color.fromARGB(255, 12, 99, 15),)
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 15),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red[100]),
                              child: Text(
                                "goanfarmersmarket@gmail.com",
                                style: Theme.of(context).textTheme.headline6!,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SingleCity(
                                        cityData: clityList[0],
                                      ),
                                    ));
                              },
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(bottom: 15),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[100]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    
                                    Container(
                                      width: 230,
                                      child: Text(
                                        "House No 61/A, 1st Daddio, Navelim, India, Goa",
                                        style: Theme.of(context).textTheme.headline6!,
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: Icon(Icons.directions_rounded,size: 36,color: const Color.fromARGB(255, 5, 59, 104),))
                                  ],
                                ),
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
