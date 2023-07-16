import 'package:anup_oak_assignment/screens/homescreen/homescreen.dart';
import 'package:anup_oak_assignment/widgets/customkeyboard.dart';
import 'package:anup_oak_assignment/widgets/customnav.dart';
import 'package:anup_oak_assignment/widgets/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class Details extends StatefulWidget {
  Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.025,
                ),
                Padding(
                  padding: EdgeInsets.all(screenHeight * 0.03),
                  child: Row(
                    children: [
                      Text(
                        "Just a step away !",
                        style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontSize: screenHeight * 0.025,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomTextForm(title: 'Full Name*', screenHeight: screenHeight),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                CustomTextForm(title: 'Email ID*', screenHeight: screenHeight),
                SizedBox(
                  height: screenHeight * 0.53,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenHeight * 0.04, right: screenHeight * 0.04),
                  child: SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.056,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomNavBar()));
                      },
                      child: Text(
                        "Let’s Start",
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: screenHeight * 0.016,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6318AF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
