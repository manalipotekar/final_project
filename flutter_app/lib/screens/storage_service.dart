import 'dart:io';

import 'package:firebase_core/firebase_core.dart' as firebase_core ;
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage ;
import 'package:flutter/material.dart';
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
  const ProductImagePicker(this.getImageValue, {super.key});



  @override
  State<ProductImagePicker> createState() => _ProductImagePickerState();
}

class _ProductImagePickerState extends State<ProductImagePicker> {
var pickedImage;




  
 pickImage(ImageSource imageType) async {
    final ImagePicker picker = ImagePicker();

    try {
      final photo = await picker.pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
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
        SizedBox(
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
           style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white),
                        foregroundColor: MaterialStatePropertyAll<Color>(Colors.green)
                            ),
          onPressed: (){
            pickImage(ImageSource.gallery);
            // imagePickerOption();
            },
          icon: const Icon(Icons.image),
          label: const Text('Add Image'),
        ),
      ],
    );
  }
}