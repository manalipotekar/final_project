import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/components/custom_button.dart';
import 'package:flutter_app/components/custom_text_input.dart';
import 'package:flutter_app/utils/application_state.dart';
import 'package:flutter_app/utils/common.dart';
import 'package:flutter_app/utils/custom_theme.dart';
import 'package:flutter_app/utils/login_data.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordTextController =
      TextEditingController(); //initialization of variable for text feild
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  bool _loading_button = false;


  static var data1 = LoginData.signin;
  // Map<String, String> data1 ={};
  _loginScreenState() {
    data1 = LoginData.signin;
    // var v = data1["heading"];
    // print(v);
  }

  // data = LoginData.signin;
  var v = data1["heading"];

  void switchLogin() {
    setState(() {
      if (mapEquals(data1, LoginData.signup)) {
        data1 = LoginData.signin;
      } else {
        data1 = LoginData.signup;
      }
    });
  }

  
  loginError(FirebaseAuthException e) {
    log(e.message as String);
    if (e.message as String== '') {
      setState(() {
        _loading_button = false;
      });

     CommonUtil.showAlert(context, "Error processing your request ", e.message.toString());
    }else{
       setState(() {
        _loading_button = false;
      });

      print(e);
    }
  }


  void loginButtonPressed() {

    setState(() {
      _loading_button = true;
    });
    ApplicationState applicationState =
        Provider.of<ApplicationState>(context, listen: false);
    if (mapEquals(data1, LoginData.signup)) {
      applicationState.signUp(
          _emailTextController.text, _passwordTextController.text, loginError);
          

    } else {
      applicationState.signIn(
          _emailTextController.text, _passwordTextController.text, loginError);
    }

  }


  @override
  Widget build(BuildContext context) {
var img=data1["image"] as String;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          
          child: Container(
            
             decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  img,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 30,top:30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(data1["heading"] as String,
                              style: TextStyle(fontSize: 38,color:Color.fromARGB(118, 1, 96, 50)))),
                      Text(
                        data1["subHeading"] as String,
                        style: TextStyle(fontSize: 18,color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                model(data1, _emailTextController, _passwordTextController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 58,
                      child: TextButton(
                        
                          onPressed: switchLogin,
                          child: Text(data1['footer'] as String,style: TextStyle(color: Colors.grey),)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  model(Map<String, String> data1, TextEditingController emailTextController,
      TextEditingController passwordTextController) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 54),
      // decoration: CustomTheme.getCardDecoration(),
      
      child: Column(
        children:[
          
          CustomTextInput(
            
              label: "Email",
              placeholder: "email@address.com",
              icon: Icons.email,
              textEditingController: _emailTextController),
          CustomTextInput(
              label: "Password",
              placeholder: "password",
              icon: Icons.lock,
              password: true,
              textEditingController: _passwordTextController),
          CustomButton(
            text: data1["label"] as String,
            onPress: loginButtonPressed,
            loading: _loading_button,
          )
        ],
      ),
    );
  }
}
