import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/components/grid_card.dart';
import 'package:flutter_app/components/loader.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/screens/crop_screen.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../models/product.dart';
import '../utils/firestore.dart';

class ListItemsByCategory extends StatefulWidget {
  const ListItemsByCategory({super.key});

  @override
  State<ListItemsByCategory> createState() => _ListItemsByCategoryState();
}

class _ListItemsByCategoryState extends State<ListItemsByCategory> {
  Future<List<Product>>? products;
  final List<String> phoneNumber = <String>[
    '6666677897',
    '7777777777',
    '3498789678',
    '7897989780'
  ];
  final List<String> callType = <String>[
    "Incoming",
    "Outgoing",
    "Incoming",
    "Missed"
  ];

  @override
  void initState() {
    super.initState();
    products = FirestoreUtil.getProducts([]);
  }

  var firestoreDB =
      FirebaseFirestore.instance.collection("product").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "AGRICROP",
          ),
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(214, 96, 212, 100),
          toolbarHeight: 70,
        ),
        body: Container(


          child: Column(
            children: [
              SizedBox(
                child: Text("data"),
                height: 100,
              )
              
              ,


              StreamBuilder(
               
                  stream: firestoreDB,
                  
                  builder: (context, snapshot) {
                     if (snapshot.hasData && snapshot.data != null) {
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (!snapshot.hasData) return CircularProgressIndicator();
                        return Card(
                          color: Colors.white,
                          borderOnForeground: true,
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePageScreen()));
                                },
                                leading: 
                                SizedBox(
                                  width: 120,
                                  child: CachedNetworkImage(imageUrl:snapshot.data!.docs[index]['image'])),
                                title: Text(snapshot.data!.docs[index]['title'],
                                    style: TextStyle(color: Colors.green)),
                                subtitle: Text(
                                  snapshot.data!.docs[index]['title'] ,
                                  style: TextStyle(color: Colors.orangeAccent),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SizedBox(
                                    width: 100,
                                  ),
                                  TextButton(
                                    child: const Text('Dail'),
                                    onPressed: () {/* ... */},
                                  ),
                                  const SizedBox(width: 8),
                                  TextButton(
                                    child: const Text('Add to Cart'),
                                    onPressed: () {/* ... */},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    );
                  }
                  
                  else{
                  return Center(child: loader());
                }
                  }
                  ),
            ],
          ),
        )

  

        //   SingleChildScrollView(
        //     child: Padding(
        //     padding: EdgeInsets.all(10),
        //     child: Container(
        //       child: Column(
        //         children: [
        //           Container(

        //             padding: EdgeInsets.all(10),
        //             decoration: BoxDecoration(  color: Colors.yellow[100],borderRadius: BorderRadius.all(Radius.circular(20))),
        //             child: Column(
        //               children: [
        //                 GestureDetector(
        //                 onTap: (() {
        //                                     Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));

        //                 }),
        //                   child: Container(
        //                     height: 170,
        //                     width: 400,
        //                     child: Image.asset("assets/rice.jpeg",fit: BoxFit.fitWidth,),
        //                   ),
        //                 ),
        //                 Row(
        //                   children: [
        //                     Column(
        //                       children: [

        //                         Container(

        //                            alignment: Alignment.topLeft,
        //                           padding: EdgeInsets.all(4),
        //                           child: Text("Title",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
        //                         ),
        //                         Text("data")
        //                       ],
        //                     ),
        //                     Container(width: 300,
        //                       alignment: Alignment.topRight, child: Text("\$200",))
        //                   ],
        //                 )
        //               ],
        //             ),
        //           )

        //         ],
        //       ),
        //     ),
        // ),
        //   )
        );
  }

  Icon starIcon(Color color) {
    return Icon(
      Icons.star,
      size: 10.0,
      color: color,
    );
  }
}
