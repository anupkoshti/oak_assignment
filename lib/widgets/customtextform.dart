import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextForm extends StatelessWidget {
  String title;
  double screenHeight;

  CustomTextForm({Key? key, required this.title, required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.03),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: title,
          labelStyle: GoogleFonts.lexend(
            color: Color(0xff7B7B7B),
            fontSize:
                screenHeight * 0.017, // Adjust the font size proportionally
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.015,
            horizontal: screenHeight * 0.016,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffC9C5C9)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffC9C5C9)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffC9C5C9)),
          ),
        ),
      ),
    );
  }
}
