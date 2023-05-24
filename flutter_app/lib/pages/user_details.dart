import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admin/testing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/components/custom_button.dart';
import 'package:provider/provider.dart';

import '../utils/application_state.dart';

class UserDetailAdd extends StatefulWidget {
  const UserDetailAdd({super.key});

  @override
  State<UserDetailAdd> createState() => _UserDetailAddState();
}

class _UserDetailAddState extends State<UserDetailAdd> {
   final _formKey1 = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
   User user=Provider.of<ApplicationState>(context, listen: false).user!;
   dynamic id=user.uid;
   dynamic displayName=user.displayName;
  //  String phoneNumber = '';
  TextEditingController address=TextEditingController(text: "");
  String Address="";
String phoneNumber = "1234567890";  // Example phone number
TextEditingController _phoneNumberController = TextEditingController(text: phoneNumber);
String verificationCode = "123456"; // Example verification code


    return Scaffold(
       appBar: AppBar(
            title: Text(
              "AGRICROP",
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 96, 212, 100),
            toolbarHeight: 70,
          ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey1,
            child: ListView(
              shrinkWrap: true,
            children: [
              TextFormField(
                initialValue: user.displayName,
                onChanged: (value) {
                  user.updateDisplayName(value);
                  
                },

                
                keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
              ),
              TextFormField(
                onChanged: (value) {
                  Address=value;
                print(Address);
                },
                keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Address Line 1',
                  ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Address Line 2',
                  ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Pin Code',
                  ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                // controller: _phoneNumberController,
               onChanged: (value) {

    
  },
                
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
              ),
              SizedBox(height: 100,),
              CustomButton(text: "Update", onPress: (){ 
                updateUser(name: displayName, address: Address, Id: id);
              })
             
            ],
          ))
        )),
    );
  }


Future updateUser({required String name,required String address,required String? Id}) async {
  //  final docUser = FirebaseFirestore.instance.collection('users');
    final user = UserP(id: Id.toString(), name: name,address:address);

  //   // final user = User(id: docUser.id, name: name);
  //   final json = user.toJson();
  //   await docUser.add(json);
  // var UserId= FirebaseFirestore.instance.collection('users').where(['id'], isEqualTo: Id);
  // print(UserId.toString());

    var collection = FirebaseFirestore.instance.collection('users');
collection 
    .doc("GeyVC9XnMOh3MRbTLqqG") 
    .update({'address' : address}) // <-- Updated data
    .then((_) => print('Success'))
    .catchError((error) => print('Failed: $error'));

}


}
class UserP {
  String id;
  final String name;
  final String address;

  UserP({
    this.id = '',
    required this.name,
    required this.address
  });
  Map<String, dynamic> toJson() => {'id': id, 'name': name,'address':address};
}
