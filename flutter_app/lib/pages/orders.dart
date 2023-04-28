import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/grid_card.dart';
import 'package:flutter_app/components/list_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/cart.dart';
import '../utils/application_state.dart';
import '../utils/firestore.dart';




class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {



  @override
  Widget build(BuildContext context) {
User u=Provider.of<ApplicationState>(context, listen: false).user!;
var id=u.uid;
  var firestoreDB=FirebaseFirestore.instance.collection("orders").where("id", isEqualTo:id).snapshots();

    return Scaffold(
         appBar: AppBar(
           
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 96, 212, 100),
            toolbarHeight: 70,
          ),



  body:   Container(
  
          child: StreamBuilder(
            stream: firestoreDB,
            builder: (context,  snapshot
            ) {
              if(!snapshot.hasData) return CircularProgressIndicator();
              return ListView.builder(
                
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context,int index) {
                return 
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.all(Radius.circular(15)),
                    boxShadow:   [
                    BoxShadow(
                      color: Color.fromARGB(232, 204, 204, 204),
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                        BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    )
                    ],
                  ),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),

                  child: 
                      Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            
                            flex: 3,
                    child: CachedNetworkImage(
                      height: 115,
                      imageUrl: snapshot.data!.docs[index]['image'],
                    fit:BoxFit.contain,
                    ),

                            
                            ),
                          Expanded(
                            
                            flex:7,
                            child: Container(
                              padding: EdgeInsets.all(14),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text( snapshot.data!.docs[index]['title'],
                                  style: TextStyle( fontSize: 16),
                                  ),
                                  Text( snapshot.data!.docs[index]['price'].toString())
                                ],
                              ),
                            ))

                        ],
                      ),
                      
                    
                );
              }));
            }),
        ),














        //   body:   Container(
        //   child: StreamBuilder(
        //     stream: firestoreDB,
        //     builder: ((context, snapshot) {
        //       if(!snapshot.hasData) return CircularProgressIndicator();
        //       return ListView.builder(
                
        //         shrinkWrap: true,
        //         itemCount: snapshot.data!.docs.length,
        //         itemBuilder: ((context,int index) {
        //         return Container(child: Text(snapshot.data!.docs[index]['title']));
        //       }));
        //     })),
        // ),



    );
  }
  
  static User? creat(User user) {}
}