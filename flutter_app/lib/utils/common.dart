import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';




class CommonUtil{

  static const String apiUrl='http://192.168.52.217:4242';
  static const String stripeUserCreate="/add/user";
  static const String checkout="/checkout";




  static backendCall(User user,String endPoint) async{
    // print(user);
    
    String token=await user.getIdToken();
    // print("Token "+token);
    try{
      return http.post(Uri.parse(apiUrl+ endPoint),headers: {
      "Accept":"application/json",
      "Content-Type":"application/json",
      "Authorization":"Bearer $token",
    });
    } 
    catch(e){
      print("backendcall err: $e");
    }
  }

  static Future<String> checkoutFlow(User user)async{
    String error="";
    try{
      Response response=await backendCall(user, checkout);
      var json =jsonDecode(response.body);
      SetupPaymentSheetParameters parameters=SetupPaymentSheetParameters(
        customerId: json["customer"],
        customerEphemeralKeySecret: json["ephemeralKey"],
        paymentIntentClientSecret: json["paymentIntent"],
        merchantDisplayName: "Shoppers"
      );
      Stripe.instance.initPaymentSheet(paymentSheetParameters: parameters);
      await Future.delayed(const Duration(seconds: 1));
      await Stripe.instance.presentPaymentSheet();
    }on StripeException catch(e){
      log("Stripe error : ${e.error.message}");
      error=e.error.message.toString();
    }catch(e,stackTrace){
log("Error with backend api call ",stackTrace: stackTrace,error: e);
error="Network error, try after some time";
    }
    return error;
  }

  static showAlert(context,String heading,String body){
    showDialog(context: context, builder: (BuildContext context) => AlertDialog(
      title: Text(heading),
      content: Text(body),
      actions: [
        TextButton(onPressed: ()=>Navigator.pop(context,'ok'
        ), child: const Text('Ok'))
      ],
    ));
  }


}