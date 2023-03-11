import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/loader.dart';


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
          borderRadius: BorderRadius.circular(35), color: Colors.green[600]),
      child: MaterialButton(
          onPressed: loading ? null : onPress,
          child: loading ?const loader() : Text(text)),
    );
  }
}