import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


class CommonUtil{

  static const String apiUrl='http://127.0.0.1:52651';
  static const String stripeUserCreate="/add/user";
  static const String checkout="/checkout";




  static backendCall(User user,String endPoint) async{
    print(user);
    
    String token=await user.getIdToken();
    print("Token "+token);
    try{
      return http.post(Uri.parse(apiUrl+ endPoint),headers: {
      "Accept":"application/json",
      "Content-Type":"application/json",
      "Authorization":"Bearer " + token,
    });
    } 
    catch(e){
      print("backendcall err: "+ e.toString());
    }
  }
}