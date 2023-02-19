import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/signin_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  //if flutter needs to call a native code before runapp
  await Firebase.initializeApp();        //needs to call native code to initialize firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {   //build is container (stateless widget) 
    return GetMaterialApp(    //core component,we can accsess all other components provided by flutter
      title: 'Flutter Demo',
      theme: ThemeData(      //used to design the fonts and colors
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(), //widget defined in home is displayed when the application starts normally
      
    );
  }
}

