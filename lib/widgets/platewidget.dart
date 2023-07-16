import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlateWidget extends StatelessWidget {
  String title;
  PlateWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 220,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              height: 210,
              width: 200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.lexend(
                              color: Colors.black,
                              fontSize:
                                  12 // Adjust the font size proportionally
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "3 starters",
                          style: GoogleFonts.lexend(
                              color: Color(0xff242424),
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  12 // Adjust the font size proportionally
                              ),
                        ),
                        Text(
                          "3 maincourse",
                          style: GoogleFonts.lexend(
                              color: Color(0xff242424),
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  12 // Adjust the font size proportionally
                              ),
                        ),
                        Text(
                          "3 deserts",
                          style: GoogleFonts.lexend(
                              color: Color(0xff242424),
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  12 // Adjust the font size proportionally
                              ),
                        ),
                        Text(
                          "3 drinks",
                          style: GoogleFonts.lexend(
                              color: Color(0xff242424),
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  12 // Adjust the font size proportionally
                              ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Color(0xff7E7E7E),
                          size: 20,
                        ),
                        Text(
                          "Min 800",
                          style: GoogleFonts.lexend(
                              color: Color(0xff7E7E7E),
                              fontSize:
                                  11 // Adjust the font size proportionally
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Row(
                      children: [
                        Text(
                          "Starts at ₹ 777",
                          style: GoogleFonts.lexend(
                              color: Color(0xff6318AF),
                              fontSize:
                                  11 // Adjust the font size proportionally
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            child: Image.asset(
              'assets/plate1.png',
              height: 150,
              width: 150,
            ),
          ),
        ],
      ),
    );
  }
}
