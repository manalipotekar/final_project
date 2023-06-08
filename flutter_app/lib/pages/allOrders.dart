import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/application_state.dart';




class AllOrders extends StatefulWidget {
  const AllOrders({super.key});

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  @override
  Widget build(BuildContext context) {
   User u=Provider.of<ApplicationState>(context, listen: false).user!;
var id=u.uid;
  var firestoreDB=FirebaseFirestore.instance.collection("orders").snapshots();
  var firestoreDB1=FirebaseFirestore.instance.collection("users").snapshots();
  
  // print(firestoreDB1.map((event) => event.toString()));

    return Scaffold(
         appBar: AppBar(
           title: const Text("Your Orders",textAlign: TextAlign.start, style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,),),
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 96, 212, 100),
            toolbarHeight: 70,
          ),



  body:  
   Padding(
    padding: const EdgeInsets.all(2),
    child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
      child: ListView(
        shrinkWrap: true,
        children: [
    
          Container(
          
                  child: StreamBuilder(
                    stream: firestoreDB,
                    builder: (context,  snapshot
                    ) {
                      if(!snapshot.hasData) return const CircularProgressIndicator();
                      return SingleChildScrollView(
                        child: ListView.builder(
                          
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: ((context,int index) {
                          return 
                          SingleChildScrollView(
                            child: Container(
                              height: 130,
                              decoration: const BoxDecoration(
                                borderRadius:BorderRadius.all(Radius.circular(15)),
                                boxShadow:   [
                                BoxShadow(
                                  color: Color.fromARGB(232, 204, 204, 204),
                                  offset: Offset(
                                    5.0,
                                    5.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),
                                    BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                )
                                ],
                              ),
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8),
                                    
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
                                          padding: const EdgeInsets.all(14),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text( snapshot.data!.docs[index]['title'],
                                              style: const TextStyle( fontSize: 16),
                                              ),
                                              Text( snapshot.data!.docs[index]['price'].toString())
                                            ,
                                              Text("Ordered By ${snapshot.data!.docs[index]['username']}")
                                            ],
                                          ),
                                        ))
                                    
                                    ],
                                  ),
                                  
                                
                            ),
                          );
                        })),
                      );
                    }),
                ),
        ],
      ),
    ),
  ),












    );
  }
}