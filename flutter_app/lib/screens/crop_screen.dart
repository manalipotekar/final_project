
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/reusuable_widgets/reusable_widget.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
String url='';
  TextEditingController name1 = TextEditingController();
  String stringresponse = "";
  String name = ""; //user's response will be assigned to this variable
  String final_response =
      ""; //will be displayed on the screen once we get the data from the server
  final _formkey =
      GlobalKey<FormState>(); //key created to interact with the form
  
  OutlineInputBorder _inputformdeco() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide:
          BorderSide(width: 1.0, color: Colors.blue, style: BorderStyle.solid),
    );
  }

  Widget build(BuildContext context) {
    var url='';
    var data;
    String output="initial output";
    return Scaffold(
      
      body: Container(

        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200),
            Container(
              width: 350,
              child: Form(
                // key: _formkey,
                child: TextFormField(
                    controller:name1,

                  decoration: InputDecoration(
                    labelText: 'Enter your name: ',
                    enabledBorder: _inputformdeco(),
                    focusedBorder: _inputformdeco(),
                  ),
                  onSaved: (name1) {
                    name =
                        name1 as String; //getting data from the user form and assigning it to name
                        print("mmmmmmmmmmmmmmmmmmmmmmmmmmmm"+name1);
                  },
                  onChanged: (name1){
                    url='https://reqres.in/api/users?name1=' + name1.toString();
                    print("\n---------------------------------------"+url);
                    // url='http://10.0.2.2:5000/api?query=' + value.toString();
                  },
                
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                data= await http.get(Uri.parse(url));
                data=jsonDecode(data);

                } catch (err) {
                  print(err.toString());
                }
                //sending a post request to the url
              },
              child: Text('SEND'),
              // color: Colors.blue,
            ),
            TextButton(onPressed: () async{
              

              try {
                data= await http.get(Uri.parse(url));
                var data1=jsonDecode(data);
                print(data1.toString());
                } catch (err) {
                  print(err);
                }
              setState(() {

                output=data.toString();
              });

            },child: Text('Fetch ASCII value'),
            ),
            Text(output),


            ElevatedButton(
              onPressed: () async {
                //url to send the get request to
                
                
                //getting data from the python server script and assigning it to response
                // http.Response response;
                //  response = await http.get(url);

                // if (response.statusCode == 200) {
                //   setState(() {
                //     stringresponse = response.body;
                //     Map mapResponse = json.decode(stringresponse);

                //     Map final_response = mapResponse['data'];
                //     name = final_response['first_name'].toString();
                //     // name=mapResponse['first_nam'].toString();
                //   });
                // } else {
                //   Text("hello");
                //   // console.log("hello");
                // }
              },
              child: Text('GET'),
              // color: Colors.lightBlue,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
