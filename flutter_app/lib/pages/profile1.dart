import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_button.dart';
import 'package:flutter_app/pages/allOrders.dart';
import 'package:flutter_app/pages/orders.dart';
import 'package:flutter_app/pages/user_details.dart';
import 'package:flutter_app/screens/add_product.dart';
// import 'package:flutter_app/pages/user_details.dart';
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

User u=Provider.of<ApplicationState>(context, listen: false).user!;
  var firestoreDB=FirebaseFirestore.instance.collection("users").where("id", isEqualTo:u.uid).snapshots();


     final cartRef =  FirebaseFirestore.instance
          .collection("users").where("id",isEqualTo: u.uid)
          ;
          print(cartRef);
         

    return  Container(
         width: MediaQuery.of(context).size.width,  //sizing an elements relative to screen size
          height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/grass.PNG"),
              fit: BoxFit.cover,  //covering the entire target box.
            ),
          ),
        padding: const EdgeInsets.all(12),
        child:Column(
          
          children: [ 
            const SizedBox(height: 180,child:Icon(Icons.person_rounded,  size: 90.0,),
            ),
            Container(
              
              margin: const EdgeInsets.all(7),  
              padding: const EdgeInsets.all(19),
              width: 400.0, 
              decoration: BoxDecoration(
                  
                  color: const Color.fromARGB(255, 219, 211, 207),
              
                border: Border.all(width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(20),)
              ),
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("manali"),
                  
                  IconButton(icon:const Icon(Icons.edit),onPressed: () {
                    Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserDetailAdd()));
                  }, )
                ],
              ),
            ),
             GestureDetector(
                 onTap: ()   {Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddProductScreen()));} ,
               child: Container(
                margin: const EdgeInsets.all(7),  
                padding: const EdgeInsets.all(19),
                width: 400.0, 
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 219, 211, 207),
                    
                  border: Border.all(width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(20),)
                ),
                child: const Text("Sell with us"),
                           ),
             ),
             GestureDetector(
                              onTap: ()   {Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AllOrders()));} ,
               child: Container(
                margin: const EdgeInsets.all(7),  
                padding: const EdgeInsets.all(19),
                width: 400.0, 
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 219, 211, 207),
                  border: Border.all(width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(20),)
                ),
                child: const Text("About us"),
                           ),
             ),
             GestureDetector(
              onTap: ()   {Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyOrders()));} ,
               child: Container(
                margin: const EdgeInsets.all(7),  
                padding: const EdgeInsets.all(19),
                width: 400.0, 
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 219, 211, 207),
                  border: Border.all(width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(20),)
                ),
                child: const Text("Your Orders"),
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