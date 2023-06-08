import 'package:flutter/material.dart';


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
            const TextField(
              // decoration: InputDecoration(border: Border.all()),
            ),

            ElevatedButton(onPressed: () {
              
            }, child: const Text("Press"),
            )
          ],
        ),
      ),
    );
  }
}