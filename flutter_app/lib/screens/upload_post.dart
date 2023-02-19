
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_app/screens/storage_service.dart';

class UploadPostScreen extends StatefulWidget {
  const UploadPostScreen({Key? key}) : super(key: key);

  @override
  _UploadPostScreenState createState() => _UploadPostScreenState();
}


class _UploadPostScreenState extends State<UploadPostScreen> {
  TextEditingController _title = TextEditingController();  //initialization of variable for text feild
  TextEditingController _emailTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();   //Create a Form with a GlobalKey

  final Storage storage=Storage();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          "My Community",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        
      ),
      
      body: Container(
          child: SingleChildScrollView(   //allows us to scroll, provides its children with an infinite amount of space.
                child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 10), 
            child: Form(
                key: formKey,
                child:Column(
                  children: [
                      TextFormField(
                      controller: _title, 
                      ),
                      ElevatedButton(
                        onPressed: ()async{
                          final results=await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type:FileType.custom,
                            allowedExtensions: ['png','jpg']
                          );
                          if(results==null){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("No file selected"),
                              ) 
                              );
                              return null;
                          }
                          final filePath=results.files.single.path;
                          final fileName=results.files.single.name;
                          print(filePath);
                          print(fileName);

                          storage.uploadFile(filePath, fileName).then((value)=>print('Done')) ;

                        },
                      
                      child: Text("Upload image"))
                  ],
                )
            )
                )
          ),
      ),
    );
  }
}