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
    String output = '';
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
            title: Text(
              "Crop Recommendation",
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 96, 212, 100),
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
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 250, 232, 208)),
                      child: TextFormField(
                        onChanged: (value) {
                          n=value;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                        // controller: n,
                        style: TextStyle(
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
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 250, 232, 208)),
                      child: TextFormField(
                        onChanged: (value) {
                          p=value;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                        // controller: p,
                        style: TextStyle(
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
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 250, 232, 208)),
                      child: TextFormField(
                            onChanged: (value) {
                          k=value;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                        // controller: k,
                        style: TextStyle(
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
                        Text(
                          "Temperature ",
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 150,
                          margin: EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 250, 232, 208)),
                          child: TextFormField(
                                onChanged: (value) {
                          temperature=value;
                        },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: InputBorder.none,
                            ),
                            // controller: temperature,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Rainfall ",
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 150,
                          margin: EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 250, 232, 208)),
                          child: TextFormField(
                                onChanged: (value) {
                          rainfall=value;
                        },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: InputBorder.none,
                            ),
                            // controller: rainfall,
                            style: TextStyle(
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
                        Text(
                          "Humidity ",
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 150,
                          margin: EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 250, 232, 208)),
                          child: TextFormField(
                                onChanged: (value) {
                          humidity=value;
                        },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: InputBorder.none,
                            ),
                            // controller: humidity,
                            style: TextStyle(
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
                          margin: EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 250, 232, 208)),
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
                SizedBox(height: 40),
      
      
                Container(
                  width: 190,
                  height:45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: ElevatedButton(
           style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all( 
                      Radius.circular(20)
                  )
                ),
              ),
                    
                    onPressed: ()async {
                      String nit=n.toString();
                      String phros=p.toString();
                      // String k1=k.toString();
      url = 'http://10.0.2.2:5000/api?query=' + nit.toString()+'&q2='+phros.toString()+'&k='+k.toString()+'&temp='+temperature.toString()+'&humidity='+humidity.toString()+'&rainfall='+rainfall.toString()+'&pH='+pH.toString();
                    
                    data = await fetchdata(url);
                    var decoded = jsonDecode(data);
                    setState(() {
                       output = decoded['output'];

                      // url='';
                    });
      
                    }, child: Text("Predict"),
                    
                    ),
                    margin: EdgeInsets.all(4),
                    ),
                    Text("You may grow " +
                output.toString() ,
                style: TextStyle(fontSize: 40, color: Colors.green),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
