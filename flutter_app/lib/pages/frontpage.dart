import 'package:flutter/material.dart';
import 'package:flutter_app/pages/crop_info/cropList.dart';
import 'package:flutter_app/pages/fruits.dart';
import 'package:flutter_app/pages/profile1.dart';
import 'package:flutter_app/pages/recommendation/crop_recommendation.dart';
import 'package:flutter_app/pages/recommendation/fertilizer_recommendation.dart';
import 'package:flutter_app/pages/vegetables.dart';


// import 'package:flutter_app/screens/crop_screen.dart';
import 'package:flutter_app/screens/myCommunity.dart';
// import 'package:flutter_app/screens/fertilizer_screen.dart';
// import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/nearbyShops.dart';
import 'package:flutter_app/utils/color_utils.dart';

import 'home.dart';
import 'my_community.dart';

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
          backgroundColor:  Colors.green[100],
          appBar: AppBar(
            // leading:Icon(Icons.kitesurfing_outlined),
            title: const Text(
              "",
            ),
            foregroundColor: Colors.white,
          backgroundColor: Color(0xff7ED957),
            // backgroundColor: Colors.blue,
            toolbarHeight: 100,
            shadowColor:Colors.white,
                  automaticallyImplyLeading: false,
                    shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0))),
          ),


          
          bottomNavigationBar:  Container(
              height: 60,
              color: Colors.white,
              
              child: TabBar(
         
               
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
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.shopping_bag),
                      child: Text(
                        "Shop",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.people),
                      child: Text(
                        "Community",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.person),
                      child: Text(
                        "My Account",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ])),
          body: const TabBarView(children: [
            // Testing(),
            frontpage1(),
            HomeScreen(),
            // MainScreen(),
            // HomePage(),
            // AddProductScreen(),
            MyCommunityScreen(),
            // MyCommunity(),
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
                  height: MediaQuery.of(context).size.height * 0.75,
      
      decoration: BoxDecoration(
        
        color: Colors.green[100],
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 9),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                                builder: (context) => const FertilizerScreen()));
                      }),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        height: 110,
                        width: 140,
                        decoration: const BoxDecoration(
                            // border: Border.all(
                            //     width: 3,
                            //     color: Color.fromARGB(255, 199, 198, 198)),

                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset("assets/crop2.jpeg"),
                              // fit: BoxFit.contain,
                            ),
                            Text(
                              "Crop recomendation",
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 199, 198, 198)),
                          borderRadius: const BorderRadius.all(Radius.circular(20))),
                    ),
                    GestureDetector(
                     onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NearbyShops()));
                      }),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        height: 110,
                        width: 150,
                        decoration: const BoxDecoration(
                            // border: Border.all(
                            //     width: 3,
                            //     color: Color.fromARGB(255, 199, 198, 198)),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset("assets/rice.jpeg"),
                              // fit: BoxFit.contain,
                            ),
                            Text(
                              "Nearby Shops",
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: const Text(
                        "     Shop Home Grown Products                             ",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 21)),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3,
                                        color:
                                            const Color.fromARGB(255, 199, 198, 198)),
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(20))),
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
                                  builder: (context) =>const FruitsScreen()));
                        },
                                      ),
                                    )),
                                    const Text("Fruits")
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(6),
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3,
                                        color:
                                            const Color.fromARGB(255, 199, 198, 198)),
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(20))),
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
                                                      const VegetablesScreen()));
                                        },
                                      ),
                                    )),
                                    const Text("Vegetables")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          
                          padding: const EdgeInsets.all(9),
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3,
                                  color: const Color.fromARGB(255, 199, 198, 198)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          
                          child: Column(
                            children: [
                              Expanded(
                                  child: Image.asset("assets/coconut.jpeg")),
                              const Text("Oils",),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3,
                                  color: const Color.fromARGB(255, 199, 198, 198)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/rice.jpeg")),
                              const Text("Rice")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width:double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: Container(
                          width: 100,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff7ED957),
                            ),
                            child: const Text(
                              "Others",textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            )),
                      ))
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                width: 410,
                padding: const EdgeInsets.only(top: 6, left: 5),
                child:
                    const Text("  Cultivation Tips", style: TextStyle(fontSize: 22)),
              ),
              Container(
                height: 130,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 110,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: const Color.fromARGB(255, 199, 198, 198)),
                          borderRadius: const BorderRadius.all(Radius.circular(20))),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/potato.jpeg"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(30),
                      height: 110,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: const Color.fromARGB(255, 199, 198, 198)),
                          borderRadius: const BorderRadius.all(Radius.circular(20))),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/crop2.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 110,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: const Color.fromARGB(255, 199, 198, 198)),
                          borderRadius: const BorderRadius.all(Radius.circular(20))),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/papaya.jpeg"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const cropList()));
                        },
                        child: const Icon(Icons.arrow_forward_ios,
                        color: Colors.grey,
                        )
                        ),
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
