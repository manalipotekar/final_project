import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CropInfo extends StatefulWidget {
  const CropInfo({super.key});

  @override
  State<CropInfo> createState() => _CropInfoState();
}

class _CropInfoState extends State<CropInfo> {
  bool viewVisible = false;
  //if want to create array in use dictionary

  void showWidget() {
    if (viewVisible == true) {
      setState(() {
        viewVisible = false;
      });
    } else {
      setState(() {
        viewVisible = true;
      });
    }
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 96, 212, 100),
        toolbarHeight: 70,
      ),
      body: Container(
         width: MediaQuery.of(context).size.width,  //sizing an elements relative to screen size
          height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/grass.PNG"),
              fit: BoxFit.cover,  //covering the entire target box.
            ),
          ),
          child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Cashew",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 310,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Image.asset("assets/cashew.jpg", fit: BoxFit.cover),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 212, 212, 212)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Introduction",
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                  onPressed: (() {
                                    showWidget();
                                  }),
                                  icon:
                                      Icon(Icons.keyboard_arrow_down_rounded)),
                            ],
                          ),
                          Visibility(
                              visible: viewVisible,
                              maintainState: true,
                              child: Container(
                                  width: double.infinity,
                                  child: Text("Rice is the staple food crop of Goa. The crop is cultivated over an area of 42,973 ha with a production of 1,55,818 mt annually. The average productivity of the crop is about 3,399 kg/ha."))),
                        ],
                      ),
                    ),

 Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 212, 212, 212)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Land Preparation",
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                  onPressed: (() {
                                    showWidget();
                                  }),
                                  icon:
                                      Icon(Icons.keyboard_arrow_down_rounded)),
                            ],
                          ),
                          Visibility(
                              visible: viewVisible,
                              maintainState: true,
                              child: Container(
                                  width: double.infinity,
                                  child: Text("Prepare the land by ploughing at right moisture situation and level the surface by planking to conserve the moisture using a country plough or stir the soil using a rotavator. Take care to uproot the weeds fully and allow them to dry out"))),
                        ],
                      ),
                    ),


        
                  ]))),
    );
  }
}
