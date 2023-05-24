import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/frontpage.dart';
import 'package:flutter_app/screens/signin_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../reusuable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SignUpScreen());
}

class _SignUpScreenState extends State<SignUpScreen> {
  void validate() {
    if (formKey.currentState != null) {
      formKey.currentState!.validate();   //returns true if no errors and form is valid
      print("ok");
    } else {
      print("error");
    }
  }

  InputDecoration inputDec(String text, IconData icon) {
    return InputDecoration(
      labelText: text,    //label
      border: OutlineInputBorder(),  //creates border for input feild
      prefixIcon: Icon(
        icon,
        color: Color.fromARGB(118, 5, 88, 48),
      ),
      labelStyle:
          TextStyle(color: Color.fromARGB(118, 5, 88, 48).withOpacity(0.9)), 
      filled: true,  //this is true if hovered or border is focused
      floatingLabelBehavior: FloatingLabelBehavior.never,  // the label will always float at the top of the field above the content.
      fillColor: Color.fromARGB(255, 174, 232, 142).withOpacity(0.3),   //colr of input container
      focusedErrorBorder: new OutlineInputBorder(   //focused and error text is not null
        borderRadius: new BorderRadius.circular(30.0),
        borderSide: BorderSide(width: 3, color: Color.fromARGB(118, 5, 88, 48)),
      ),
      enabledBorder: OutlineInputBorder(  //not focused border
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
              width: 3, color: Color.fromARGB(118, 5, 88, 48))
              
              ),
      focusedBorder: new OutlineInputBorder(  //displayed when InputDecorator.isFocused is true and
        borderRadius: new BorderRadius.circular(30.0),
        borderSide: BorderSide(width: 3, color: Color.fromARGB(118, 5, 88, 48)),
      ),
      errorBorder: new OutlineInputBorder(  //when error text is not null
        borderRadius: new BorderRadius.circular(30.0),
        borderSide: BorderSide(width: 3, color: Color.fromARGB(118, 5, 88, 48)),
      ),
    );
  }


  TextEditingController _passwordTextController = TextEditingController();  //initialization of variable for text feild
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();   //Create a Form with a GlobalKey
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,  //If true, and an appBar is specified, then the height of the body is extended 
                                //to include the height of the app bar and the top of the body is aligned with the top of the app bar.
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,  //sizing an elements relative to screen size
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/pink.PNG"),
              fit: BoxFit.cover,  //covering the entire target box.
            ),
          ),
          child: SingleChildScrollView(   //allows us to scroll, provides its children with an infinite amount of space.
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 10), 
            child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.always,  //validate as we enter characters
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(118, 5, 88, 48)),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Create your new account",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _userNameTextController,  //value of field
                      style: TextStyle(color: Color.fromARGB(118, 5, 88, 48)),
                      decoration: inputDec("Name", Icons.person),  //call inputDec() method
                      validator: MultiValidator([   //validation for Name
                        RequiredValidator(errorText: "Required"),
                        MinLengthValidator(2, errorText: "min 2")
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: _emailTextController,
                        style: TextStyle(color: Color.fromARGB(118, 5, 88, 48)),
                        decoration: inputDec("Email", Icons.email),
                        validator: MultiValidator([                          
                          RequiredValidator(errorText: "Required"),
                          EmailValidator(errorText: "Email not valid"),                        
                        ])),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordTextController,
                      obscureText: true,
                      style: TextStyle(color: Color.fromARGB(118, 5, 88, 48)),
                      decoration: inputDec("Password", Icons.key),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                        MinLengthValidator(7, errorText: "Minimum 7 characters"),
                        PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    signInSignUpButton(context, false, () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(   //using firebase authentication registers the user
                              email: _emailTextController.text,
                              password: _passwordTextController.text
                              
                              )
                          .then((value) {
                            String? u=value.user?.uid.toString();
                            
                            print(u);
                        print("Created New Account");
                        createUser(name: _userNameTextController.text,Id:u);   //saves Name of user
                  value.user?.updateDisplayName(_userNameTextController.text);
                        
                        Navigator.push(   //To switch to new screen
                            context,
                            MaterialPageRoute(  //route to next page
                                builder: (context) => frontPage()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");  //if error the display on debug console
                      });
                    }),
                    signInOption()
                  ],
                )),
          ))),
    );
  }


//method to save user details in database
  Future createUser({required String name,required String? Id}) async {
    final docUser = FirebaseFirestore.instance.collection('users');
    final user = User(id: Id.toString(), name: name);

    // final user = User(id: docUser.id, name: name);
    final json = user.toJson();
    await docUser.add(json);

  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,  //aligns elements horizontally
      children: [
        const Text("Already have an account?",
            style: TextStyle(color: Color.fromARGB(179, 90, 89, 89))),
        GestureDetector(  //detecting the user’s gesture.
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          child: const Text(
            " Sign In",
            style: TextStyle(
                color: Color.fromARGB(104, 20, 205, 66),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class User {
  String id;
  final String name;

  User({
    this.id = '',
    required this.name,
  });
  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
