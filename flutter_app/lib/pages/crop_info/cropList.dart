import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/pages/crop_info/cropInfo.dart';

class cropList extends StatefulWidget {
  const cropList({super.key});

  @override
  State<cropList> createState() => _cropListState();
}

class _cropListState extends State<cropList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text(
              "Crop Info",
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 96, 212, 100),
            toolbarHeight: 70,
          ),
        body: GridView.builder(
            itemCount: 10,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  decoration: BoxDecoration(
                    // border: Border.all(),
                    // borderRadius: BorderRadius.circular(20)
                  ),
                  margin: EdgeInsets.all(10),
                  // padding: EdgeInsets.all(10),
                  child: GestureDetector(
                      onTap:() {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>CropInfo()));
                      }  ,          

                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Expanded(
                                flex: 8,
                                // child: Text("data"),
                                child: Container(
                                  
                                  child: Image.asset("assets/cashew.jpg",fit:BoxFit.cover),
                                )
                                ),
                             Expanded(flex:2,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                child: Text("Cashew",
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                              )),
                            
                          
                          ],
                        ),),

                      ));
            }));
  }
}
