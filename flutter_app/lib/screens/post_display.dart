
import 'package:flutter/material.dart';

class PostDisplay extends StatefulWidget {
  const PostDisplay({super.key});

  @override
  State<PostDisplay> createState() => _PostDisplayState();
}

class _PostDisplayState extends State<PostDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Add New Post'),
      ),
      body: SingleChildScrollView(
        child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
  
        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Container( 
                margin: const EdgeInsets.only(bottom: 10),
                height: 250,
                        width: double.infinity,
                              child: Image.asset("assets/pink1.jpg",
                              fit: BoxFit.fill,
                              ),
                            ),
                       Container(
                        margin: const EdgeInsets.all(2),
                         child: const Text(
                    "Title",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                       ),
                  Container(
                    margin: const EdgeInsets.all(2),
                    height: 60,
                    child: const Text(
                      "The [overflow] property's behavior is affected by the [softWrap] argument. If the [softWrap] is true or null, the glyph causing overflow, efected by the [softWrap] argument. If the [softWrap] is true or null, the glyph causing overflow, ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.green)
                    // ),
                    child: const Text("10 likes",style: TextStyle(
                          color: Colors.green,
                        ), ),
                  )
            ],
          ),)),
    );
  }
}