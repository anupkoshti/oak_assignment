import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DishesWidget extends StatelessWidget {
  final String image;
  final String title;
  final double height;
  final double width;

  DishesWidget({
    required this.image,
    required this.height,
    required this.width,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: width,
      height: height,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: width,
              height: height * 0.7, // Adjust the value as needed
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.lexend(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
