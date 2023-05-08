import 'package:flutter/material.dart';

Color green = const Color.fromRGBO(8, 129, 58, 1);

class MyCommunity extends StatefulWidget {
  const MyCommunity({super.key});

  @override
  State<MyCommunity> createState() => _MyCommunityState();
}

// 248, 235, 218

class _MyCommunityState extends State<MyCommunity> {
  final _commentController = TextEditingController();
  List comments = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 235, 218, 1),
      appBar: AppBar(
        title: Center(
          child: const Text(
            "My Community",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w400),
          ),
        ),
        backgroundColor: green,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0))),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 45),
          child: Center(
            child: Column(
              children: [
                // Container(
                //     height: size.height * 0.45,
                //     child: Column(children: [
                //       Row(
                //         children: [
                //           Padding(
                //             padding: EdgeInsets.symmetric(
                //                 horizontal: 16, vertical: 20),
                //             child: Image.asset(
                //               'assets/Seethamma.png',
                //               width: 80,
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 20,
                //           ),
                //           const Text(
                //             "My Story",
                //             style: TextStyle(
                //                 fontSize: 28, fontWeight: FontWeight.w400),
                //           )
                //         ],
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(
                //           horizontal: 16,
                //         ),
                //         child: Text(
                //             "Adaribariki Seethamma is a lead natural farmer from Pedalabudu village of Araku Mandal, in Visakhapatnam district of Andhra Pradesh."),
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 20),
                //         child: Align(
                //           alignment: Alignment.centerLeft,
                //           child: ElevatedButton.icon(
                //               onPressed: () {},
                //               label: Text(
                //                 "Like",
                //                 style: TextStyle(color: green),
                //               ),
                //               icon: Icon(
                //                 Icons.thumb_up,
                //                 color: green,
                //               ),
                //               style: ElevatedButton.styleFrom(
                //                   elevation: 0,
                //                   backgroundColor: Colors.white,
                //                   side: BorderSide(width: 1, color: green))),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 24, top: 5),
                //         child: Align(
                //             alignment: Alignment.centerLeft,
                //             child: Text("22 likes")),
                //       ),
                //     ]),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Colors.white,
                //         border:
                //             Border.all(width: 4, color: Colors.grey.shade300))),
                // SizedBox(
                //   height: 10,
                // ),
                // // End of One story+++++++++++++++++++++++++++++
                // Container(
                //   height: size.height * 0.45,
                //   child: Column(children: [
                //     Row(
                //       children: [
                //         Padding(
                //           padding: EdgeInsets.symmetric(
                //               horizontal: 16, vertical: 20),
                //           child: Image.asset(
                //             'assets/Rani.png',
                //             width: 80,
                //           ),
                //         ),
                //         SizedBox(
                //           width: 20,
                //         ),
                //         Text(
                //           "My Story",
                //           style: TextStyle(
                //               fontSize: 28, fontWeight: FontWeight.w400),
                //         )
                //       ],
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 16,
                //       ),
                //       child: Text(
                //           "Smt. Rani is a lead farmer from Sambepalli Mandal of Kadapa district. She is an ardent Natural Farming practitioner. Since 2019, she has been cultivating vegetables and leafy greens in the pre-monsoon dry sowing method."),
                //     ),
                //     SizedBox(
                //       height: 10,
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 20),
                //       child: Align(
                //         alignment: Alignment.centerLeft,
                //         child: ElevatedButton.icon(
                //             onPressed: () {},
                //             label: Text(
                //               "Like",
                //               style: TextStyle(color: green),
                //             ),
                //             icon: Icon(
                //               Icons.thumb_up,
                //               color: green,
                //             ),
                //             style: ElevatedButton.styleFrom(
                //                 elevation: 0,
                //                 backgroundColor: Colors.white,
                //                 side: BorderSide(width: 1, color: green))),
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 24, top: 5),
                //       child: Align(
                //           alignment: Alignment.centerLeft,
                //           child: Text("22 likes")),
                //     ),
                //   ]),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white,
                //     border: Border.all(width: 4, color: Colors.grey.shade300),
                //   ),
                // ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        child: Text(
                          comments[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    itemCount: comments.length,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _commentController,
                        decoration:
                            InputDecoration(hintText: "Post your comments"),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //Write your Firebase query here

                        //------------//
                        setState(() {
                          print(comments);
                          comments.add(_commentController.text);
                          _commentController.clear();
                        });
                      },
                      icon: Icon(Icons.send),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
