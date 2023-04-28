import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'test.dart';


class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Column(
          children: [
            TextField(
              // decoration: InputDecoration(border: Border.all()),
            ),

            ElevatedButton(onPressed: () {
              
            }, child: Text("Press"),
            )
          ],
        ),
      ),
    );
  }
}