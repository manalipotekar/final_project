import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/frontpage.dart';
import 'package:flutter_app/screens/signup_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../reusuable_widgets/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  InputDecoration inputDec(String text, IconData icon) {
    return InputDecoration(
      labelText: text,
      border: const OutlineInputBorder(),
      prefixIcon: Icon(
        icon,
        color: const Color.fromARGB(118, 5, 88, 48),
      ),
      labelStyle:
          TextStyle(color: const Color.fromARGB(118, 5, 88, 48).withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color.fromARGB(255, 174, 232, 142).withOpacity(0.3),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 3, color: Color.fromARGB(118, 5, 88, 48)),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
              width: 3, color: Color.fromARGB(118, 5, 88, 48))),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 3, color: Color.fromARGB(118, 5, 88, 48)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 3, color: Color.fromARGB(118, 5, 88, 48)),
      ),
    );
  }

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
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
                              style: const TextStyle(
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
                                const TextStyle(color: Color.fromARGB(118, 5, 88, 48)),
                            decoration: inputDec("Password", Icons.key),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required"),
                              MinLengthValidator(7, errorText: "min 7")
                            ]),
                          ),
                            const SizedBox(
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
                                      builder: (context) => const frontPage()));
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
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
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
