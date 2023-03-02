import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/components/custom_button.dart';
import 'package:flutter_app/utils/application_state.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _loadingButton=false;
  var firestoreDB=FirebaseFirestore.instance.collection("product").snapshots();

void signOutButtonPressed(){
  setState(() {
    _loadingButton=true;
  });
  Provider.of<ApplicationState>(context,listen:false).signOut();
}

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal:30),
    child: Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: StreamBuilder(
            stream: firestoreDB,
            builder: ((context, snapshot) {
              if(!snapshot.hasData) return CircularProgressIndicator();
              return ListView.builder(
                
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,itemBuilder: ((context,int index) {
                return Container(child: Text(snapshot.data!.docs[index]['title']));
              }));
            })),
        ),

        Padding(padding: EdgeInsets.only(bottom: 20),
        child: Text("Hi there"),),
        CustomButton(text: "Sign out", onPress: signOutButtonPressed,loading:_loadingButton ,)
      ],
    ),
    );
  }
}