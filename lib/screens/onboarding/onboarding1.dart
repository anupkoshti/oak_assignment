// import 'package:anup_oak_assignment/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.07),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.17),
                SvgPicture.asset("assets/onboarding1.svg"),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Create Your Own Plate",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexend(fontSize: screenWidth * 0.056),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Create unforgettable memories with our unique feature to curate your favorite cuisines and food, tailored to your special occasion.",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexend(
                    fontSize: screenWidth * 0.038,
                    color: Color(0xff7B7B7B),
                  ),
                ),
                SizedBox(height: screenHeight * 0.12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
