import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/pages/crop_info/cropInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class cropList extends StatefulWidget {
  const cropList({super.key});

  @override
  State<cropList> createState() => _cropListState();
}

class _cropListState extends State<cropList> {

  var firestoreDB = FirebaseFirestore.instance.collection("crop-info").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text(
              "Crop Info",
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 96, 212, 100),
            toolbarHeight: 70,
          ),
        body:

      StreamBuilder(
                                stream: firestoreDB,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData)
                                    return CircularProgressIndicator();
                                  return SingleChildScrollView(
                                    child: 

			GridView.builder(
        gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.docs.length,
                                        
                                        itemBuilder: ((context, int index) {
                                          return SingleChildScrollView(
                                            child: Container(
                                            
 margin: EdgeInsets.all(10),
                  // padding: EdgeInsets.all(10),
                  child: Container(

                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         GestureDetector(
                          onTap: (){

                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>CropInfo(crop_name: snapshot.data?.docs[index]['name'],)));
                          },

                           child: Container(
                            height: 150,
                            child: Image.asset("assets/cashew.jpg",fit:BoxFit.cover),
                           ),
                         ),
                         Container(
                                padding: EdgeInsets.all(3),
                                child: Text( snapshot.data?.docs[index]['name'],
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                              )
                        ],
                      )
     


                                            ),),
                                          );
                                        })),
                                  );
                                }),
                                

            
            
            
            
            );
  }
}
