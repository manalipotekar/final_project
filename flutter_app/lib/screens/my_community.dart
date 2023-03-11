
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/add_product.dart';
import 'package:get/get.dart';


class MyCommunityScreen extends StatefulWidget {
  const MyCommunityScreen({Key? key}) : super(key: key);

  @override
  _MyCommunityScreenState createState() => _MyCommunityScreenState();
}


class _MyCommunityScreenState extends State<MyCommunityScreen> {
  // final AddProductScreen controller= Get.find();

  @override
  Widget build(BuildContext context) {




    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          "My Community",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              
            },
            icon: Icon(Icons.add),
          ),        
        ],
      ),

      




      
      // body: Column(
      //   children: [
      //     SizedBox(
      //       height:30
      //     ),
      //    Container(
      //      decoration: BoxDecoration(
      //                     border: Border.all(color: Colors.blueAccent),
      //                      borderRadius: BorderRadius.all(Radius.circular(5.0) ),
      //                     ),                         
      //                     padding: const EdgeInsets.all(3.0),
      //                     margin: const EdgeInsets.all(15.0),
      //     child: Column(
      //       children: [
      //         Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      //           children: [
      //             Container(
                   
      //               child: Padding(
      //               padding:  EdgeInsets.all(8.0),
      //               child: Text("photo")
      //               ,)
      //             ),
      //             Container(
      //               child: Padding(
      //               padding:  EdgeInsets.all(8.0),
      //               child: Text("Text")
      //               ,)
      //             ),
      //           ],
      //         ),
      //         Padding(
      //           padding: EdgeInsets.all(8.0),
      //           child: Text("h"),
      //         ),
      //       ],
      //     )
      //    ),        
      //   ],
      // ),
    );
  }
}