import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final Color fillColor;
  final String imagePath;
  final double height;
  final String topic;

  const CategoryButton({
    Key? key,
    required this.fillColor,
    required this.imagePath,
    required this.height,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: fillColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                topic,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Image.asset('images/topArrow.png'), // Adjusted image path
            ],
          ),
          Image.asset(imagePath),
        ],
      ),
    );
  }
}
