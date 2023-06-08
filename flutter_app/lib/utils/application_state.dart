import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/utils/common.dart';

enum AplicationLoginState { loggedOut, loggedIn }

class ApplicationState extends ChangeNotifier {
  User? user;
  AplicationLoginState loginState = AplicationLoginState.loggedOut;
  ApplicationState() {
    init();
  }

  Future init() async {
    FirebaseAuth.instance.userChanges().listen((useFir) {
      if (useFir != null) {
        // print(useFir);
        user=useFir;
        print("manali");
        loginState = AplicationLoginState.loggedIn;
        notifyListeners();
      } else {
        print("natasha");
        loginState = AplicationLoginState.loggedOut;
        notifyListeners();
      }
      // notifyListeners();
    });
  }

  Future<void> signIn(String email, String password,
      void Function(FirebaseAuthException e) errorCallBack) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallBack(e);
    }
  }

  Future<void> signUp(String email, String password,
      void Function(FirebaseAuthException e) errorCallBack) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
          print("curr user ${FirebaseAuth.instance.currentUser}");
          // print(FirebaseAuth.instance.userChanges());

      try {
        log("inside signup");
        //  log(userCredential.user!.uid);
      
        await CommonUtil.backendCall(
            userCredential.user!, CommonUtil.stripeUserCreate);
          notifyListeners();
       
      } catch (e) {
        log("error1$e");
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      errorCallBack(e);
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
