import 'package:flutter/material.dart';
import 'package:online_course_application/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String childText;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.childText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328, // Fixed width
      height: 53, // Fixed height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.appPowderBlue, // Light purple color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.zero, // Remove default padding
        ),
        child: Center(
          child: Text(
            childText,
            style:  TextStyle(fontSize: 14,color: AppColor.appRichBlack),
          ),
        ),
      ),
    );
  }
}
