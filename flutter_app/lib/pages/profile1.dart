import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        
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
             ElevatedButton(onPressed: (() {
               
             }), child: Text("                                           Log Out                                           "),
             style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green) ),
             )
          ],
        )
      
        )
    );
  }
}