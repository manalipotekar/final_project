import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/pages/profile.dart';
import 'package:flutter_app/pages/profile1.dart';

import 'checkout.dart';
import 'home.dart';

class frontPage extends StatefulWidget {
  const frontPage({super.key});

  @override
  State<frontPage> createState() => _frontPageState();
}

class _frontPageState extends State<frontPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "AGRICROP",
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 96, 212, 100),
            toolbarHeight: 70,
          ),
          bottomNavigationBar: Container(
              child: const TabBar(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  indicatorColor: Colors.green,
                  labelColor: Colors.green,
                  tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                  ),
                ),
                Tab(icon: Icon(Icons.shopping_bag)),
                Tab(icon: Icon(Icons.people)),
                Tab(icon: Icon(Icons.person)),
              ])),
          body: TabBarView(
          children: [frontpage1(), ProfileScreen(), CheckoutScreen(),MyAccount()]),



          // body: frontpage1(),
        ));
    // );
    //
  }
}

class frontpage1 extends StatelessWidget {
  const frontpage1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[100],
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  
                ),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Container(
                      child: Column(
                        children: [
                          Expanded(child:
                                Image.asset("assets/crop2.jpeg"),
                                // fit: BoxFit.contain,
                             ),
                          
                          Text("Crop Recommendation")
                        ],
                      ),
                      padding: EdgeInsets.all(9),
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: Color.fromARGB(255, 199, 198, 198)),
                             
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                    ),
                     Container(
                      child: Column(
                        children: [
                          Expanded(child:
                                Image.asset("assets/fertilizer.jpeg"),
                                // fit: BoxFit.contain,
                             ),
                          
                          Text("Fertilizer Recomendation")
                        ],
                      ),
                      padding: EdgeInsets.all(9),
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: Color.fromARGB(255, 199, 198, 198)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                    ),


                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                  
                    child: Text(
                      
                        "    Shop Home Grown Products                             ",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 22)),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(child: Image.asset( "assets/pineaple.jpeg")),
                                    Text("Fruits")
                                  ],
                                ),
                                padding: EdgeInsets.all(5),
                                height: 110,
                                width: 160,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3,
                                        color: Color.fromARGB(
                                            255, 199, 198, 198)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20))),
                              ),
 Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Image.asset( "assets/tomato.jpeg")),
                                    Text("Vegetables")
                                  ],
                                ),
                                padding: EdgeInsets.all(6),
                                height: 110,
                                width: 160,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3,
                                        color: Color.fromARGB(
                                            255, 199, 198, 198)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),


                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                        Container(

                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/coconut.jpeg")),
                              Text("Oils"),
                              
                            ],
                          ),
                          padding: EdgeInsets.all(9),
                          height: 110,
                          width: 160,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3,
                                  color:
                                      Color.fromARGB(255, 199, 198, 198)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),


                        Container(

                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/rice.jpeg")),
                              Text("Rice")
                            ],
                          ),
                          padding: EdgeInsets.all(9),
                          height: 110,
                          width: 160,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3,
                                  color:
                                      Color.fromARGB(255, 199, 198, 198)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 169),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        
                          backgroundColor: Colors.green),
                      onPressed: () {},
                      child: Text("more"),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
               border: Border.all(
                              color: Colors.white),
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                ),
                width: 410,
                
                child: Text("  Cultivation Tips",style:TextStyle(fontSize: 22)),
                padding: EdgeInsets.all(4),
              ),
              Container(
                height: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/potato.jpeg"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      height: 110,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: Color.fromARGB(255, 199, 198, 198)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/crop2.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.all(30),
                      height: 110,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: Color.fromARGB(255, 199, 198, 198)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/papaya.jpeg"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      height: 110,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: Color.fromARGB(255, 199, 198, 198)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                    ),
                    Icon(Icons.arrow_right),
                    
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
