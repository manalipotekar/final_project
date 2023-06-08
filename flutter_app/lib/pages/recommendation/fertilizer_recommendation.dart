import 'dart:convert';

import 'package:flutter/material.dart';

import 'function.dart';

class Fertilizer_Recommendation2 extends StatefulWidget {
  const Fertilizer_Recommendation2({super.key});

  @override
  State<Fertilizer_Recommendation2> createState() =>
      _Fertilizer_Recommendation2State();
}

class _Fertilizer_Recommendation2State
    extends State<Fertilizer_Recommendation2> {
  String url = '';
  var data;

  static List<String> cropList = <String>[
    'Maize',
    'Sugarcane',
    'Cotton',
    'Tobacco',
    'Paddy',
    'Barley',
    'Wheat',
    'Millets',
    'Oil seeds',
    'Pulses',
    'Ground Nuts',
  ];

  static List<String> soilList=['Black','Sandy','Loamy','Red','Clayey'];

  String? dropdownValue1 = soilList.first;


  String? dropdownValue = cropList.first;

  String output = '';
  String n = '';
  String p = '';
  String k = '';
  String temperature = '';
  String rainfall = '34';
  String pH = '45';
  String humidity = '';
  String soil = '';
  String crop = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fertilizer Recommendation",
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
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 250, 232, 208)),
                      child: TextFormField(
                        onChanged: (value) {
                          n = value;
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
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 250, 232, 208)),
                      child: TextFormField(
                        onChanged: (value) {
                          p = value;
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
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 250, 232, 208)),
                      child: TextFormField(
                        onChanged: (value) {
                          k = value;
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
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 150,
                          margin: const EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 250, 232, 208)),
                          child: TextFormField(
                            onChanged: (value) {
                              temperature = value;
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
                          "Humidity ",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 150,
                          margin: const EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 250, 232, 208)),
                          child: TextFormField(
                            onChanged: (value) {
                              humidity = value;
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
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Text(
                          "Crop ",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 40,
                          padding: const EdgeInsets.all(4),
                          width: 150,
                          margin: const EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3,
                                  color: const Color.fromARGB(255, 86, 86, 86)),
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 252, 244, 235)),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                            ),
                            value: dropdownValue,
                            items: cropList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),

                      
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                           
                              crop=value!;
                              print(crop);
                              setState(() {
                                dropdownValue = value;
                              });
                            },
                          ),

                          // TextFormField(
                          //   onChanged: (value) {
                          //     crop = value;
                          //   },
                          //   decoration: const InputDecoration(
                          //     contentPadding: EdgeInsets.all(10),
                          //     border: InputBorder.none,
                          //   ),
                          //   // controller: humidity,
                          //   style: TextStyle(
                          //     fontSize: 16,
                          //   ),
                          // ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Soil Type",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
     Container(
                          height: 40,
                          padding: const EdgeInsets.all(4),
                          width: 150,
                          margin: const EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3,
                                  color: const Color.fromARGB(255, 86, 86, 86)),
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 252, 244, 235)),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                            ),
                            value: dropdownValue1,
                            items: soilList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),

                      
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                           
                              soil=value!;
                              print(soil);
                              setState(() {
                                dropdownValue1 = value;
                              });
                            },
                          ),

                          // TextFormField(
                          //   onChanged: (value) {
                          //     crop = value;
                          //   },
                          //   decoration: const InputDecoration(
                          //     contentPadding: EdgeInsets.all(10),
                          //     border: InputBorder.none,
                          //   ),
                          //   // controller: humidity,
                          //   style: TextStyle(
                          //     fontSize: 16,
                          //   ),
                          // ),
                        ),

                        // Container(
                        //   width: 150,
                        //   margin: EdgeInsets.only(top: 10, right: 10),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(20),
                        //       color: Color.fromARGB(255, 250, 232, 208)),
                        //   child: TextFormField(
                        //     onChanged: (value) {
                        //       soil = value;
                        //     },
                        //     decoration: const InputDecoration(
                        //       contentPadding: EdgeInsets.all(10),
                        //       border: InputBorder.none,
                        //     ),
                        //     // controller: pH,
                        //     style: const TextStyle(
                        //       fontSize: 16,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                    width: 190,
                    height: 45,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      onPressed: () async {
                        String nit = n.toString();
                        String phros = p.toString();
                        // url = 'http://10.0.2.2:5000/api/fertilizer?n='+n.toString()+'&p='+p.toString()+'&k='+k.toString()+'&temp='+temperature.toString()+'&humidity='+humidity.toString()+'&crop='+crop.toString()+'&soil='+soil.toString();
                        url = 'http://10.0.2.2:5000/api/fertilizer?query=$nit&q2=$phros&k=$k&temp=$temperature&humidity=$humidity&crop=$crop&soil=$soil';

                        data = await fetchdata(url);
                        var decoded = jsonDecode(data);
                        setState(() {
                          output = decoded['output'];
                          // url='';
                        });
                      },
                      child: const Text("Predict"),
                    )),
                Text("You may use $output as fertilizer",
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
