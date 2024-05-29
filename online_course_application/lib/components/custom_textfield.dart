import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final Color borderColor;
  final Color inputTextColor; // New parameter for input text color

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.borderColor = Colors.grey,
    this.inputTextColor = Colors.white, // Default input text color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: inputTextColor), // Set input text color here
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: borderColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: borderColor),
          ),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
