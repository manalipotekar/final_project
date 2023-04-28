import 'package:flutter/material.dart';
import 'package:flutter_app/screens/add_post.dart';
import 'package:flutter_app/screens/add_product.dart';
import 'package:flutter_app/screens/post_display.dart';
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
          backgroundColor: Colors.white,
          elevation: 0,
          // title: const Text(
          //   "My Community",
          //   textAlign: TextAlign.center,
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          // ),
          actions: [
            IconButton(
              onPressed: () {
 Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddPostScreen()));

              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Container(
          color: Color.fromARGB(255, 253, 240, 196),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(10),
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    height: 190,
                    decoration: BoxDecoration(
                    
                      border: Border.all(
                        width: 2,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: 
                    GestureDetector( onTap: () {
                       Navigator.push(context,
                MaterialPageRoute(builder: (context) => PostDisplay()));

                    },
                      child: Container( 
                        width: double.infinity,
                              child: Image.asset("assets/pink1.jpg",
                              fit: BoxFit.fill,
                              ),
                            ),
                    ),
                  ),
                  Text(
                    "Title",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    
                    height: 60,
                    child: Text(
                      "The [overflow] property's behavior is affected by the [softWrap] argument. If the [softWrap] is true or null, the glyph causing overflow, efected by the [softWrap] argument. If the [softWrap] is true or null, the glyph causing overflow, ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white),
                        foregroundColor: MaterialStatePropertyAll<Color>(Colors.green)
                            ),
                    onPressed: () {},
                    child: Icon(Icons.thumb_up),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
