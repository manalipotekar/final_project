import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/pages/frontpage.dart';
import 'package:flutter_app/screens/crop_screen.dart';
import 'package:flutter_app/screens/fertilizer_screen.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/screens/my_community.dart';
import 'package:flutter_app/screens/signup_screen.dart';
import 'package:flutter_app/screens/upload_post.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../reusuable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  InputDecoration inputDec(String text, IconData icon) {
    return InputDecoration(
      labelText: text,
      border: OutlineInputBorder(),
      prefixIcon: Icon(
        icon,
        color: Color.fromARGB(118, 5, 88, 48),
      ),
      labelStyle:
          TextStyle(color: Color.fromARGB(118, 5, 88, 48).withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Color.fromARGB(255, 174, 232, 142).withOpacity(0.3),
      focusedErrorBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(30.0),
        borderSide: BorderSide(width: 3, color: Color.fromARGB(118, 5, 88, 48)),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
              width: 3, color: Color.fromARGB(118, 5, 88, 48))),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(30.0),
        borderSide: BorderSide(width: 3, color: Color.fromARGB(118, 5, 88, 48)),
      ),
      errorBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(30.0),
        borderSide: BorderSide(width: 3, color: Color.fromARGB(118, 5, 88, 48)),
      ),
    );
  }

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/signin.PNG"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 95,
                          ),
                          const Text(
                            "Welcome back",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(118, 5, 88, 48)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Signin to your account",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          TextFormField(
                              controller: _emailTextController,
                              style: TextStyle(
                                  color: Color.fromARGB(118, 5, 88, 48)),
                              decoration: inputDec("Email", Icons.email),
                              validator: MultiValidator([
                                EmailValidator(errorText: "Not valid"),
                                RequiredValidator(errorText: "Required"),
                              ])
                              ),
                              const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _passwordTextController,
                            obscureText: true,
                            style:
                                TextStyle(color: Color.fromARGB(118, 5, 88, 48)),
                            decoration: inputDec("Password", Icons.key),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required"),
                              MinLengthValidator(7, errorText: "min 7")
                            ]),
                          ),
                            SizedBox(
                            height: 25,
                          ),
                          signInSignUpButton(context, true, () {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text)
                                .then((value) {
                                  
                                  
                              print("signin success");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => frontPage()));
                            }).onError((error, stackTrace) {
                              print("Error ${error.toString()}");
                            });
                            
                          }),
                          signUpOption()
                        ],
                      ),
                    )
                    // )
                    ))));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Color.fromARGB(179, 90, 89, 89))),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
                // MaterialPageRoute(builder: (context) => UploadPostScreen()));

          },
          child: const Text(
            " Sign Up",
            style: TextStyle(
                color: Color.fromARGB(104, 20, 205, 66),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
