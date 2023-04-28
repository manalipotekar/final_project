import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/components/custom_button.dart';
import 'package:flutter_app/pages/orders.dart';
import 'package:flutter_app/pages/user_details.dart';
import 'package:flutter_app/utils/application_state.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool _loadingButton=false;

  void signOutButtonPressed(){
  setState(() {
    _loadingButton=true;
  });
  Provider.of<ApplicationState>(context,listen:false).signOut();
}

  @override
  Widget build(BuildContext context) {
    return  Container(
         width: MediaQuery.of(context).size.width,  //sizing an elements relative to screen size
          height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/grass.PNG"),
              fit: BoxFit.cover,  //covering the entire target box.
            ),
          ),
        padding: EdgeInsets.all(12),
        child:Column(
          
          children: [ 
            Container(child:Icon(Icons.person_rounded,  size: 90.0,),
            
            height: 180,
            ),
            Container(
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Personal Details "),
                  
                  IconButton(icon:Icon(Icons.edit),onPressed: () {
                    Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserDetailAdd()));
                  }, )
                ],
              ),
              margin: EdgeInsets.all(7),  
              padding: EdgeInsets.all(19),
              width: 400.0, 
              decoration: BoxDecoration(
                  
                  color: Color.fromARGB(255, 219, 211, 207),
              
                border: Border.all(width: 3),
                borderRadius: BorderRadius.all(Radius.circular(20),)
              ),
            ),
             Container(
              child: Text("Sell with us"),
              margin: EdgeInsets.all(7),  
              padding: EdgeInsets.all(19),
              width: 400.0, 
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 219, 211, 207),
                  
                border: Border.all(width: 3),
                borderRadius: BorderRadius.all(Radius.circular(20),)
              ),
            ),
             Container(
              child: Text("About us"),
              margin: EdgeInsets.all(7),  
              padding: EdgeInsets.all(19),
              width: 400.0, 
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 219, 211, 207),
                border: Border.all(width: 3),
                borderRadius: BorderRadius.all(Radius.circular(20),)
              ),
            ),
             GestureDetector(
              onTap: ()   {Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyOrders()));} ,
               child: Container(
                child: Text("Your Orders"),
                margin: EdgeInsets.all(7),  
                padding: EdgeInsets.all(19),
                width: 400.0, 
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 219, 211, 207),
                  border: Border.all(width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(20),)
                ),
                         ),
             ),
        

             CustomButton(onPress:signOutButtonPressed,loading:_loadingButton
             , text: "Sign out"
             )
          ],
        )
      
        
    );
  }
}