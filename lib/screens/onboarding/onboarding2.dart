// import 'package:anup_oak_assignment/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({Key? key}) : super(key: key);

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
                SizedBox(height: screenHeight * 0.1),
                SvgPicture.asset("assets/onboarding2.svg"),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Exquisite Catering",
                  style: GoogleFonts.lexend(fontSize: screenWidth * 0.06),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Experience culinary artistry like never before with our innovative and exquisite cuisine creations",
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
