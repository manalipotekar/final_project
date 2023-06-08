import 'package:flutter/material.dart';

class NearByShopDetails extends StatelessWidget {
  const NearByShopDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.account_circle,
              size: 40,
            ),
          )
        ],
        backgroundColor: Colors.green,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0))),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("The Seed Store"),
                Text("Panaji, Goa, North Goa, 403001"),
                Text("9822882888"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
