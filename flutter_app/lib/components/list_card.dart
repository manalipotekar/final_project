import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:flutter_app/pages/checkout.dart';
import 'package:flutter_app/utils/custom_theme.dart';
import 'package:flutter_app/utils/firestore.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../utils/application_state.dart';

class ListCard extends StatelessWidget {
  final Cart cart;
  const ListCard({required this.cart, super.key});

  deleteProduct(User? user, String cartId) async {
    //  final cartRef = await FirebaseFirestore.instance
    //     .collection('customer')
    //     .doc(user?.uid)
    //     .collection('cart')
    //     .get();

    final cartDeleteRef = await FirebaseFirestore.instance
        .collection('customer')
        .doc(user?.uid)
        .collection('cart')
        .doc(cartId)
        .delete()
        .then(
          (doc) => print("Cart item deleted"),
          onError: (e) => print("Error updating document $e"),
        );

    print("product deleted");
  }



 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: CustomTheme.getCardDecoration(),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: cart.image,
                      fit: BoxFit.contain,
                    ),
                  )),
              Expanded(
                  flex: 6,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 7,
                              ),
                              child: Text(
                                cart.title,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                deleteProduct(
                                    Provider.of<ApplicationState>(context,
                                            listen: false)
                                        .user!,
                                    cart.id);
                               
                                 Navigator.push(
                                         
                                          context,
                                          MaterialPageRoute(
                                              //route to next page
                                              builder: (context) =>
                                                  const CheckoutScreen()));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 0),
                                child: Icon(Icons.cancel_rounded),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Qty: ${cart.count}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Rs ${cart.price}",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "COD",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
