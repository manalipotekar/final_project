import 'package:flutter/material.dart';
import 'package:flutter_app/components/loader.dart';
import 'package:flutter_app/utils/custom_theme.dart';


class CustomButton extends StatelessWidget {
  final String text;
   final void Function() onPress;
 final bool loading;
const CustomButton({Key?key, required this.text,this.loading=false,required this.onPress}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color:CustomTheme.green),
      child: MaterialButton(
          onPressed: loading ? null : onPress,
          child: loading ?const loader() : Text(text,style: const TextStyle(color: Colors.white),)),
    );
  }
}