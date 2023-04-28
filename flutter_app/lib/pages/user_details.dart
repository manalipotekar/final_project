import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/components/custom_button.dart';

class UserDetailAdd extends StatefulWidget {
  const UserDetailAdd({super.key});

  @override
  State<UserDetailAdd> createState() => _UserDetailAddState();
}

class _UserDetailAddState extends State<UserDetailAdd> {
   final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
              ),
              TextFormField(
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
                keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
              ),
              SizedBox(height: 100,),
              CustomButton(text: "Update", onPress: (){})
             
            ],
          ))
        )),
    );
  }
}
