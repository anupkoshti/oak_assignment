// import 'package:anup_oak_assignment/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/Onboarding Illustration 3.png"),
              SizedBox(height: screenHeight * 0.01),
              Text(
                "Personal Order Executive",
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(fontSize: screenWidth * 0.06),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Embark on a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way.",
                softWrap: true,
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  fontSize: screenWidth * 0.036,
                  color: Color(0xff7B7B7B),
                ),
              ),
              SizedBox(height: screenHeight * 0.12),
            ],
          ),
        ),
      ),
    );
  }
}
