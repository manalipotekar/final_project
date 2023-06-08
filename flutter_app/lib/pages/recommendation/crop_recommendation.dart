import 'dart:convert';

import 'package:flutter/material.dart';

import 'function.dart';

class FertilizerScreen extends StatefulWidget {
  const FertilizerScreen({Key? key}) : super(key: key);

  @override
  _FertilizerScreenState createState() => _FertilizerScreenState();
}

class _FertilizerScreenState extends State<FertilizerScreen> {

  TextEditingController crop = TextEditingController();

  TextEditingController soil = TextEditingController();
   String url = '';
  var data;
    // final op1=useState('');
    String output = '';
    String output1='';
    String output2='';
    String output3='';
    String output4='';


    String n='';
    String p='';
    String k='';
    String temperature='';
    String rainfall='';
    String pH='';
    String humidity='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Crop Recommendation",
            ),
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 96, 212, 100),
            toolbarHeight: 70,
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      "N :",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 250, 232, 208)),
                      child: TextFormField(
                        onChanged: (value) {
                          n=value;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                        // controller: n,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
      
                    const Text(
                      "P :",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 250, 232, 208)),
                      child: TextFormField(
                        onChanged: (value) {
                          p=value;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                        // controller: p,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const Text(
                      "K :",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 250, 232, 208)),
                      child: TextFormField(
                            onChanged: (value) {
                          k=value;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                        // controller: k,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Temperature ",
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 150,
                          margin: const EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 250, 232, 208)),
                          child: TextFormField(
                                onChanged: (value) {
                          temperature=value;
                        },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: InputBorder.none,
                            ),
                            // controller: temperature,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Rainfall ",
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 150,
                          margin: const EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 250, 232, 208)),
                          child: TextFormField(
                                onChanged: (value) {
                          rainfall=value;
                        },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: InputBorder.none,
                            ),
                            // controller: rainfall,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Humidity ",
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 150,
                          margin: const EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 250, 232, 208)),
                          child: TextFormField(
                                onChanged: (value) {
                          humidity=value;
                        },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: InputBorder.none,
                            ),
                            // controller: humidity,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "pH ",
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 150,
                          margin: const EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 250, 232, 208)),
                          child: TextFormField(
                                onChanged: (value) {
                          pH=value;
                        },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: InputBorder.none,
                            ),
                            // controller: pH,
                            style:const  TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
      
      
                Container(
                  width: 190,
                  height:45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25)
                  ),
                    margin: const EdgeInsets.all(4),
                  child: ElevatedButton(
           style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all( 
                      Radius.circular(20)
                  )
                ),
              ),
                    
                    onPressed: ()async {
                      String nit=n.toString();
                      String phros=p.toString();
                      // String k1=k.toString();
      url = 'http://10.0.2.2:5000/api?query=$nit&q2=$phros&k=$k&temp=$temperature&humidity=$humidity&rainfall=$rainfall&pH=$pH';
                    
                    data = await fetchdata(url);
                    var decoded = jsonDecode(data);
                    setState(() {
                       output = decoded['output'][2];
                       output1 = decoded['output'][0];
                        output2 = decoded['output'][1];
                         output3 = decoded['output'][2];
                          output4 = decoded['output'][3];

                      // url='';
                    });
      
                    }, child: const Text("Predict"),
                    
                    ),
                    ),
                    Text("You may grow $output1, $output2, $output3, $output4" ,
                style: const TextStyle(fontSize: 40, color: Colors.green),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
