import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../utils/custom_theme.dart';

class CustomTextInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final IconData icon;
  final TextEditingController textEditingController;
  final bool password;
  const CustomTextInput(
      {Key? key,
      required this.label,
      required this.placeholder,
      required this.icon,
      this.password = false,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            
            padding: const EdgeInsets.only(left: 20, bottom: 8),
            child:
                Text(label, style: const TextStyle( color:CustomTheme.green)),

          ),
          SizedBox(
            height: 54,
            child: TextFormField(
              controller: textEditingController,
              validator: MultiValidator([
                                EmailValidator(errorText: "Not valid"),
                                RequiredValidator(errorText: "Required"),
                              ]),
              obscureText: password,
              enableSuggestions: !password,
              autocorrect: !password,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 22, end: 22),
                  child: Icon(icon, color:CustomTheme.green, size: 24),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    borderSide: BorderSide(
                        width: 2, color: Color.fromARGB(118, 5, 88, 48))),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    borderSide: BorderSide(
                        width: 2, color: Color.fromARGB(118, 5, 88, 48))),
                filled: true,
                hintStyle: const TextStyle(color: CustomTheme.grey),
                hintText: placeholder,
                fillColor: const Color.fromARGB(255, 174, 232, 142).withOpacity(0.3),
              ),
            ),
          )
        ],
      ),
    );
  }
}
