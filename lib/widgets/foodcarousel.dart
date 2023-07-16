import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCarousel extends StatelessWidget {
  String title;
  String image;
  void Function()? ontap;
  FoodCarousel({
    required this.ontap,
    required this.title,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 80,
            width: 80,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.lexend(
                color: Colors.black,
                fontSize: 12 // Adjust the font size proportionally
                ),
          ),
        ],
      ),
    );
  }
}
