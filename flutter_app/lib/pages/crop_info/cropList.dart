import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/crop_info/cropInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class cropList extends StatefulWidget {
  const cropList({super.key});

  @override
  State<cropList> createState() => _cropListState();
}

class _cropListState extends State<cropList> {
  var firestoreDB =
      FirebaseFirestore.instance.collection("crop-info").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Crop Info",
        ),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff7ED957),
        toolbarHeight: 70,
      ),
      body: Container(
        child: StreamBuilder(
            stream: firestoreDB,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

                      crossAxisCount: 2),
                      
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, int index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      // padding: EdgeInsets.all(10),
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CropInfo(
                                            crop_name: snapshot
                                                .data?.docs[index]['name'],
                                          )));
                            },
                            child: SizedBox(
                                height: 150,
                                child: CachedNetworkImage(
                                    imageUrl: snapshot.data?.docs[index]
                                        ['image'],
                                        fit:BoxFit.cover,
                                        ),
                                        
                                        ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              snapshot.data?.docs[index]['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )),
                    );
                  }));
            }),
      ),
    );
  }
}
