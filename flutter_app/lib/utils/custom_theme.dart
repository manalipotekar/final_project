import 'package:flutter/material.dart';

class CustomTheme{
  static const Color grey= Color(0xffDFDFDF);
  static const Color yellow= Color(0xffFFD847);
  static const Color green= Color.fromARGB(255, 1, 97, 8);


  static const cardShadow=[BoxShadow(color:grey,blurRadius: 6,spreadRadius: 4,offset: Offset(0,2))];
  static getCardDecoration(){
return BoxDecoration(
  // gradient: LinearGradient(colors: [
  //   Colors.yellow,
  //   Colors.green,
  //   Colors.blue,
  // ]),
      color:Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: cardShadow,
      // border: Border.all()
);
  }
  

  static ThemeData getTheme(){
    Map<String, double> fontSize={
      "sm":14,
      "md": 18,
      "lg":24,
    };

    return ThemeData(
      primaryColor: yellow,
      appBarTheme:AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        toolbarHeight: 70,
        centerTitle: true,
        
        ),
        tabBarTheme: const TabBarTheme(
          
          labelColor:Colors.amber,
          unselectedLabelColor: Colors.black,
          
        )
    );
  }
}