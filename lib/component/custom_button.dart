import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.buttonText, this.onTap});
  String? buttonText;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        child: Center(
            child: Text(
          '$buttonText',
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.blue),
      ),
    );
  }
}
