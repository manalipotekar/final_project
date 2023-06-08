import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CropInfo extends StatefulWidget {
  final String crop_name;

  const CropInfo({required this.crop_name, super.key});
  @override
  State<CropInfo> createState() => _CropInfoState();
}

class _CropInfoState extends State<CropInfo> {
 final ScrollController _scrollController=ScrollController();
  //  double _currentPosition=1;
  double opacity = 1;

  bool viewVisible = false;
  //if want to create array in use dictionary

  void showWidget() {
    if (viewVisible == true) {
      setState(() {
        viewVisible = false;
      });
    } else {
      setState(() {
        viewVisible = true;
      });
    }
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }






  @override
  Widget build(BuildContext context) {
    String cropName = widget.crop_name.toString();
    var firestoreDB = FirebaseFirestore.instance
        .collection("crop-info")
        .where('name', isEqualTo: cropName)
        .snapshots();
// print(firestoreDB);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor:const Color(0xff7ED957),
        toolbarHeight: 70,
      ),
      body: StreamBuilder(
          stream: firestoreDB,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();
            return ListView.builder(
            controller: _scrollController,
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, int index) {
                  return SingleChildScrollView(
                    child: Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, //sizing an elements relative to screen size
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/grass.PNG"),
                            fit: BoxFit
                                .cover, //covering the entire target box.
                          ),
                        ),
                        child: SingleChildScrollView(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                         
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      snapshot.data?.docs[index]['name'],
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  NotificationListener<ScrollNotification>(
                                  
                                    child: SizedBox(
                                        height: 310,
                                        // decoration: BoxDecoration(border: Border.all()),
                                        child: AnimatedOpacity(
                                          opacity: opacity, duration: const Duration(),
                                          child: GestureDetector( 
                                            
                                           
                                            child: CachedNetworkImage(
                                                imageUrl: snapshot.data?.docs[index]
                                                    ['image']),
                                          ),
                                        )),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Color.fromARGB(
                                                255, 251, 251, 251),
                                            Color.fromARGB(255, 218, 223, 218)
                                          ]),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "INTRODUCTION",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            IconButton(
                                                onPressed: (() {
                                                  showWidget();
                                                }),
                                                icon: const Icon(Icons
                                                    .keyboard_arrow_down_rounded)),
                                          ],
                                        ),
                                        Visibility(
                                            visible: viewVisible,
                                            maintainState: true,
                                            child: SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  snapshot.data?.docs[index]
                                                      ['introduction'],style: const TextStyle(fontSize: 15),
                                                ))),
                                      ],
                                    ),
                                  ),


                                 Container(
                                    padding: const EdgeInsets.all(10),
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Color.fromARGB(
                                                255, 251, 251, 251),
                                            Color.fromARGB(255, 218, 223, 218)
                                          ]),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "LAND PREPARATION ",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            IconButton(
                                                onPressed: (() {
                                                  showWidget();
                                                }),
                                                icon: const Icon(Icons
                                                    .keyboard_arrow_down_rounded)),
                                          ],
                                        ),
                                        Visibility(
                                            visible: viewVisible,
                                            maintainState: true,
                                            child: SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  snapshot.data?.docs[index]
                                                      ['land_preparation'],style: const TextStyle(fontSize: 15),
                                                ))),
                                      ],
                                    ),
                                  ),

                                                                   Container(
                                    padding: const EdgeInsets.all(10),
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Color.fromARGB(
                                                255, 251, 251, 251),
                                            Color.fromARGB(255, 218, 223, 218)
                                          ]),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "SOWING",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            IconButton(
                                                onPressed: (() {
                                                  showWidget();
                                                }),
                                                icon: const Icon(Icons
                                                    .keyboard_arrow_down_rounded)),
                                          ],
                                        ),
                                        Visibility(
                                            visible: viewVisible,
                                            maintainState: true,
                                            child: SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  snapshot.data?.docs[index]
                                                      ['sowing'],style: const TextStyle(fontSize: 15),
                                                ))),
                                      ],
                                    ),
                                  ),

                                                                   Container(
                                    padding: const EdgeInsets.all(10),
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Color.fromARGB(
                                                255, 251, 251, 251),
                                            Color.fromARGB(255, 218, 223, 218)
                                          ]),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "DISEASE MANAGEMENT",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            IconButton(
                                                onPressed: (() {
                                                  showWidget();
                                                }),
                                                icon: const Icon(Icons
                                                    .keyboard_arrow_down_rounded)),
                                          ],
                                        ),
                                        Visibility(
                                            visible: viewVisible,
                                            maintainState: true,
                                            child: SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  snapshot.data?.docs[index]
                                                      ['disease_management'],style: const TextStyle(fontSize: 15),
                                                ))),
                                      ],
                                    ),
                                  ),

                                                                   Container(
                                    padding: const EdgeInsets.all(10),
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Color.fromARGB(
                                                255, 251, 251, 251),
                                            Color.fromARGB(255, 218, 223, 218)
                                          ]),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "HARVESTING ",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            IconButton(
                                                onPressed: (() {
                                                  showWidget();
                                                }),
                                                icon: const Icon(Icons
                                                    .keyboard_arrow_down_rounded)),
                                          ],
                                        ),
                                        Visibility(
                                            visible: viewVisible,
                                            maintainState: true,
                                            child: SizedBox(
                                                width: double.infinity,
                                                child: Text( 
                                                  snapshot.data?.docs[index]
                                                      ['harvesting'],style: const TextStyle(fontSize: 15),
                                                ))),
                                      ],
                                    ),
                                  ),


                               
                               
                                ]))),
                  );
            
            
            
                  
                }));
          }),
    );
  }
}
