import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/pages/crop_info/cropList.dart';
import 'package:flutter_app/pages/fruits.dart';
import 'package:flutter_app/pages/list_by_category.dart';
import 'package:flutter_app/pages/profile.dart';
import 'package:flutter_app/pages/profile1.dart';
import 'package:flutter_app/screens/add_product.dart';
import 'package:flutter_app/screens/crop_screen.dart';
import 'package:flutter_app/screens/fertilizer_screen.dart';
// import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/my_community.dart';
import 'package:flutter_app/screens/test.dart';

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
            // leading:Icon(Icons.kitesurfing_outlined),
            title: Text(
              "AGRICROP",
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 96, 212, 100),
            toolbarHeight: 70,
          ),
          bottomNavigationBar: Container(
              height: 60,
              child: const TabBar(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  indicatorColor: Colors.green,
                  labelColor: Colors.green,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.home,
                      ),
                      child: Text(
                        "Home",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.shopping_bag),
                      child: Text(
                        "Shop",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.people),
                      child: Text(
                        "My Community",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.person),
                      child: Text(
                        "My Account",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ])),
          body: TabBarView(children: [
            frontpage1(),
            HomeScreen(),
            // AddProductScreen(),
            MyCommunityScreen(),
            MyAccount()
          ]),

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
                margin: EdgeInsets.only(top: 9),
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
                    GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FertilizerScreen()));
                      }),
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset("assets/crop2.jpeg"),
                              // fit: BoxFit.contain,
                            ),
                            Text(
                              "Crop Recommendation",
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        ),
                        padding: EdgeInsets.all(9),
                        height: 120,
                        width: 180,
                        decoration: BoxDecoration(
                            // border: Border.all(
                            //     width: 3,
                            //     color: Color.fromARGB(255, 199, 198, 198)),

                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Color.fromARGB(255, 199, 198, 198)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset("assets/fertilizer.jpeg"),
                            // fit: BoxFit.contain,
                          ),
                          Text(
                            "Fertilizer Recomendation",
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(9),
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                          // border: Border.all(
                          //     width: 3,
                          //     color: Color.fromARGB(255, 199, 198, 198)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        child: Expanded(
                                      child: InkWell(
                                        child:
                                            Image.asset("assets/pineaple.jpeg"),
                                    
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>FruitsScreen()));
                        },
                                      ),
                                    )),
                                    Text("Fruits")
                                  ],
                                ),
                                padding: EdgeInsets.all(5),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: Expanded(
                                      child: InkWell(
                                        child:
                                            Image.asset("assets/tomato.jpeg"),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      cropList()));
                                        },
                                      ),
                                    )),
                                    Text("Vegetables")
                                  ],
                                ),
                                padding: EdgeInsets.all(6),
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
                              Expanded(
                                  child: Image.asset("assets/coconut.jpeg")),
                              Text("Oils",),
                            ],
                          ),
                          padding: EdgeInsets.all(9),
                          height: 110,
                          width: 160,
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
                                  color: Color.fromARGB(255, 199, 198, 198)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width:double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 172),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Container(
                            margin: EdgeInsets.all(3),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green,
                            ),
                            child: Text(
                              "more",
                              style: TextStyle(color: Colors.white),
                            )),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                width: 410,
                padding: const EdgeInsets.only(top: 6, left: 5),
                child:
                    Text("  Cultivation Tips", style: TextStyle(fontSize: 22)),
              ),
              Container(
                height: 140,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 110,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: Color.fromARGB(255, 199, 198, 198)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/potato.jpeg"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(30),
                      height: 110,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: Color.fromARGB(255, 199, 198, 198)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/crop2.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => cropList()));
                        },
                        child: Icon(Icons.arrow_right)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
