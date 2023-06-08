import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}

TextFormField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller, String t1) {
  if (t1 != "email") {
    validator:
    MultiValidator([
      EmailValidator(errorText: "not valid"),
      RequiredValidator(errorText: "Required"),
      MinLengthValidator(6, errorText: "min 6")
    ]);
  }

  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: const TextStyle(color: Color.fromARGB(118, 5, 88, 48)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: const Color.fromARGB(118, 5, 88, 48),
      ),
      labelText: text,
      labelStyle:
          TextStyle(color: const Color.fromARGB(118, 5, 88, 48).withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color.fromARGB(255, 174, 232, 142).withOpacity(0.3),
      //  border:OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),
      //  borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 241, 8, 8)),
      //  )
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
              width: 3, color: Color.fromARGB(118, 5, 88, 48))),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(width: 3, color: Color.fromARGB(118, 5, 88, 48)),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return const Color.fromARGB(151, 7, 143, 77);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        isLogin ? 'LOGIN' : 'SIGNUP',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
}
