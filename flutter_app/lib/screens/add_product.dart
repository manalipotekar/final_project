import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/controllers/product.dart';
import 'package:flutter_app/reusuable_widgets/commanDialog.dart';
import 'package:flutter_app/screens/crop_screen.dart';
import 'package:flutter_app/screens/fertilizer_screen.dart';
import 'package:flutter_app/screens/my_community.dart';
import 'package:flutter_app/screens/signin_screen.dart';
import 'package:flutter_app/screens/signup_screen.dart';
import 'package:flutter_app/screens/storage_service.dart';
import 'package:get/get.dart';



List<Product> loginUserData = [];

Future<void> getLoginUserProduct() async {
    print("loginUserData YEs $loginUserData");
    loginUserData = [];
    try {
      CommanDialog.showLoading();
      final List<Product> lodadedProduct = [];
      var response = await FirebaseFirestore.instance
          .collection('productlist')
          // .where('user_Id', isEqualTo: authController.userId)
          .get();

      if (response.docs.length > 0) {
        response.docs.forEach(
          (result) {
            print(result.data());
            print("Product ID  ${result.id}");
            lodadedProduct.add(
              Product(
                  productId: result.id,
                  userId: result['user_Id'],
                  productname: result['product_name'],
                  productprice: double.parse(result['product_price']),
                  productimage: result['product_image'],
                  phonenumber: int.parse(result['phone_number']),
                  productuploaddate: result['product_upload_date'].toString()),
            );
          },
        );
      }
      loginUserData.addAll(lodadedProduct);
      // update();
      // CommanDialog.hideLoading();
      
    } on FirebaseException catch (e) {
      // CommanDialog.hideLoading();
      print("Error $e");
    } catch (error) {
      // CommanDialog.hideLoading();
      print("error $error");
    }
  }




class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
var _userImageFile;
  final _formKey = GlobalKey<FormState>();
// SignUpScreen s=Get.find();
  

  Map<String, dynamic> productData = {
    "p_name": "",
    "p_price": "",
    "p_upload_date": DateTime.now().millisecondsSinceEpoch,
    "phone_number": "",
    "product_image" :"",
    "user_Id":"",
  };


  void _pickedImage(File image) {
    _userImageFile = image;
   print("Image got $_userImageFile");
   
    
  }

addProduct() async {
     _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      print("Form is vaid ");
     
      print('Data for login $productData');     
      var a=await addNewProduct(productData, _userImageFile);
  
      print('Data for login $productData$_userImageFile');     
    }
  }


Future<void> addNewProduct(Map productdata, File image) async {
    var pathimage = image.toString();
    var temp = pathimage.lastIndexOf('/');
    var result = pathimage.substring(temp + 1);
    print(result);
    final ref =
        FirebaseStorage.instance.ref().child('product_images').child(result);
    var response = await ref.putFile(image);
    print("Updated $response");
    var imageUrl = await ref.getDownloadURL();

    try {
      
      // CommanDialog.showLoading();

      var response = await FirebaseFirestore.instance.collection('productlist').add({
        'product_name': productdata['p_name'],
        'product_price': productdata['p_price'],
        "product_upload_date": productdata['p_upload_date'],
        'product_image': imageUrl,
        // 'user_Id':   s,
        "phone_number": productdata['phone_number'],
      });
      print("Firebase response1111 $response");
      // CommanDialog.hideLoading();    
      
      Get.back();
    } catch (exception) {
      // CommanDialog.hideLoading();
      print("Error Saving Data at firestore $exception");
    }
    
  }


  @override
  Widget build(BuildContext context) {
    return 
Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New Product'),
      ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                  ),
                  
                  onSaved: (value) {
                    productData['p_name'] = value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Product Price'),
                  onSaved: (value) {
                    productData['p_price'] = value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Phone Number'),

                  onSaved: (value) {
                    productData['phone_number'] = value;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ProductImagePicker(_pickedImage),


                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: addProduct,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );


  }
}