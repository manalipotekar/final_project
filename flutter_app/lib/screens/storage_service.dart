import 'dart:io';

import 'package:firebase_core/firebase_core.dart' as firebase_core ;
import 'package:flutter_app/screens/fertilizer_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage ;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class Storage{

  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance ;

  Future<void> uploadFile(
    final filePath,
    String fileName,
  )async{
    File file =File(filePath);
    try{
await storage.ref('/test$fileName').putFile(file);

    } on firebase_core.FirebaseException catch(err){
print(err);
    }
  }

}

class ProductImagePicker extends StatefulWidget {
 final void Function(File pickedImage) getImageValue;
  ProductImagePicker(this.getImageValue);



  @override
  State<ProductImagePicker> createState() => _ProductImagePickerState();
}

class _ProductImagePickerState extends State<ProductImagePicker> {
var pickedImage;




  
 pickImage(ImageSource imageType) async {
    final ImagePicker _picker = ImagePicker();

    try {
      final photo = await _picker.pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        this.pickedImage = tempImage;
        print(pickedImage);
        widget.getImageValue(pickedImage);
      });
      // Get.to(()=>FertilizerScreen());
      // Get.back();
    } catch (error) {
      print("error in storage_service.dart");
      print(error);
    }
  }


  @override
  Widget build(BuildContext context) {
    return 
Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 100,
          height: 100,
          child: pickedImage != null
              ? Image.file(
                  pickedImage!,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  'https://static.thenounproject.com/png/2413564-200.png',
                  fit: BoxFit.cover,
                ),


        ),
        ElevatedButton.icon(
          onPressed: (){
            pickImage(ImageSource.gallery);
            // imagePickerOption();
            },
          icon: Icon(Icons.image),
          label: Text('Add Image'),
        ),
      ],
    );
  }
}