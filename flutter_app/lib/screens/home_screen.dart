
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/add_product.dart';
import 'package:flutter_app/screens/my_community.dart';
import 'package:flutter_app/screens/signin_screen.dart';
import 'package:flutter_app/screens/upload_post.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          "My Community",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
               Navigator.push(context,MaterialPageRoute(builder: (context) =>MyCommunityScreen()));
            },
            icon: Icon(Icons.add),
          ),        
        ],
      ),
      

      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value){
              print("SignedOut");
            Navigator.push(context,MaterialPageRoute(builder: (context)=>SignInScreen()));
              
            });
          },
        ),
      ),
    );
  }
}