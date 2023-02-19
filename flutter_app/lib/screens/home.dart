import 'dart:convert';

import 'package:flutter_app/screens/function.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState1 createState() => _HomeState1();
}

class _HomeState1 extends State<Home> {
  String url = '';
  var data='40';
  String output = 'Initial Output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Flask App')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              onChanged: (value) {
                url = 'http://10.0.2.2:5000/api?query=' + value.toString();
              },
            ),
            TextButton(
                onPressed: () async {
                  try{
                  data = await  fetchdata(url);
                          print("\nHelllo world\n");
                  }catch(err){
                    print(err );
                  }
                  print(data);
                  var decoded = jsonDecode(data);
                  setState(() {
                    output = decoded['output'];
                  });
                },
                child: Text(
                  'Fetch ASCII Value',
                  style: TextStyle(fontSize: 20),
                )),
            Text(
              output,
              style: TextStyle(fontSize: 40, color: Colors.green),
            )
          ]),
        ),
      ),
    );
  }
}
