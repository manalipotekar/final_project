import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/models/cart.dart';
import '../models/cart.dart';

class FirestoreUtil {
  static const String productCollection = 'product';
  static const String customerCollection = 'customer';
  static const String cartCollection = 'cart';
  static const String orderCollection = 'order';

  var s = "s";

  static Future<List<Product>> getProducts(List<String>? ids) async {
    try {
      final productRef = FirebaseFirestore.instance
          .collection(productCollection)
          // .where("title", whereIn:["Yellow shoes"])

          .withConverter<Product>(
              fromFirestore: (snapshot, _) =>
                  Product.fromJson(snapshot.data()!),
              toFirestore: (product, _) => product.toJson());
      QuerySnapshot<Product> productDoc;
      if (ids != null && ids.isNotEmpty) {
        productDoc = await productRef.where('id', whereIn: ids).get();
      } else {
        productDoc = await productRef.get();
      }
      return productDoc.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e, stacktrace) {
      log("Error getting products", stackTrace: stacktrace, error: e);
    }
    return [];
  }

  static Future<List<Product>> getFruits(List<String>? ids) async {
    try {
      final productRef = FirebaseFirestore.instance
          .collection(productCollection)
          .where("category", whereIn: ["Fruits"]).withConverter<Product>(
              fromFirestore: (snapshot, _) =>
                  Product.fromJson(snapshot.data()!),
              toFirestore: (product, _) => product.toJson());
      QuerySnapshot<Product> productDoc;
      if (ids != null && ids.isNotEmpty) {
        productDoc = await productRef.where('id', whereIn: ids).get();
      } else {
        productDoc = await productRef.get();
      }
      return productDoc.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e, stacktrace) {
      log("Error getting products", stackTrace: stacktrace, error: e);
    }
    return [];
  }

  static Future<List<Product>> getVegetables(List<String>? ids) async {
    try {
      final productRef = FirebaseFirestore.instance
          .collection(productCollection)
          .where("category", whereIn: ["Vegetables"]).withConverter<Product>(
              fromFirestore: (snapshot, _) =>
                  Product.fromJson(snapshot.data()!),
              toFirestore: (product, _) => product.toJson());
      QuerySnapshot<Product> productDoc;
      if (ids != null && ids.isNotEmpty) {
        productDoc = await productRef.where('id', whereIn: ids).get();
      } else {
        productDoc = await productRef.get();
      }
      return productDoc.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e, stacktrace) {
      log("Error getting products", stackTrace: stacktrace, error: e);
    }
    return [];
  }

  static addt(User user) async {
    if (user == null) {
      return;
    }
    var productId = '1';
    try {
      DocumentReference<Map<String, dynamic>> product = FirebaseFirestore
          .instance
          .collection(customerCollection)
          .doc(user.uid)
          .collection(cartCollection)
          .doc(productId);

      if ((await product.get()).exists) {
        product.update({"count": FieldValue.increment(1)});
      } else {
        product.set({"id": productId, "count": 1});
      }
    } on FirebaseException catch (e, stacktrace) {
      log("Error adding to cart", stackTrace: stacktrace, error: e);
    }
  }

  static addToCart(User? user, String productId) async {
    if (user == null) {
      print("user is null");
      return;
    }
    try {
      DocumentReference<Map<String, dynamic>> product = FirebaseFirestore
          .instance
          .collection(customerCollection)
          .doc(user.uid)
          .collection(cartCollection)
          .doc(productId);

      if ((await product.get()).exists) {
        product.update({"count": FieldValue.increment(1)});
        log("message");
      } else {
        product.set({"id": productId, "count": 1});
      }
    } on FirebaseException catch (e, stacktrace) {
      log("Error adding to cart", stackTrace: stacktrace, error: e);
    }
  }

  static createOrder(User? user){

    Future<List<Cart>> cart=FirestoreUtil.getCart(user);

    List<Cart> orders = [];
    
    orders=cart as List<Cart>;
    
    final docCart = FirebaseFirestore.instance.collection('orders');
   
 dynamic id =user?.uid;
  

 try{
  for (int i = 0; i < orders.length; i++) {
        final  cart = Cart(orders[i].title,orders[i].price,id, orders[i].description, orders[i].image, orders[i].category, orders[i].count);
        final json =cart.toJson();
           docCart.add(json);
 
}
 }on FirebaseException catch (e, stacktrace) {
      print("error");
      log("Error adding to orders", stackTrace: stacktrace, error: e);
    }


  }

  static Future<List<Cart>> getCart(User? user) async {
    List<Cart> carts = [];
    List<Cart> orders = [];
    try {
      final cartRef = await FirebaseFirestore.instance
          .collection(customerCollection)
          .doc(user?.uid)
          .collection(cartCollection)
          .get();

      List<String> productIds = [];
      for (var element in cartRef.docs) {
        productIds.add(element['id']);
      }
      List<Product> products = await getProducts(productIds);
      for (var element in cartRef.docs) {
        Product product = products.firstWhere((prod) => prod.id == element.id);
        var json = product.toJson();
        json['count'] = element['count'];
        carts.add(Cart.fromJson(json));
        orders.add(Cart.fromJson(json));
      }
    } on FirebaseException catch (e, stacktrace) {
      log("Error getting  cart", stackTrace: stacktrace, error: e);
    }
    // ignore: prefer_interpolation_to_compose_strings
    print(orders.map((e) => e.title as String));

    final docCart = FirebaseFirestore.instance.collection('orders');
   
 dynamic id =user?.uid;
   
  dynamic t;


 Map<String, dynamic> c=orders.asMap().cast<String,dynamic >();
 print(orders[0].title);
 print(orders.length);



//    try {
//     for (int i = 0; i < orders.length; i++) {
//         final  cart = Cart(orders[i].title,orders[i].price,id, orders[i].description, orders[i].image, orders[i].category, orders[i].count);
//         final json =cart.toJson();
//            docCart.add(json);
 
// }
       
                 
//           print(docCart);
     
    
       
//     } on FirebaseException catch (e, stacktrace) {
//       print("error");
//       log("Error adding to orders", stackTrace: stacktrace, error: e);
//     }



    return carts;
  }

  static double getCartTotal(List<Cart> carts) {
    double total = 0;
    for (Cart cart in carts) {
      total += cart.price * cart.count;
    }
    return total;
  }
}
