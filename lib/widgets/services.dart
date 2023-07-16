import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class services extends StatelessWidget {
  String img;
  String logo;
  String title;
  String text1;
  String text2;
  String text3;
  String text4;
  services({
    required this.title,
    required this.img,
    required this.logo,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 520,
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                img,
                height: 200,
                width: 370,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      logo,
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: GoogleFonts.lexend(
                          color: Color(0xff6318AF),
                          fontSize: 18 // Adjust the font size proportionally
                          ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/bullet.svg"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      text1,
                      style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontSize: 14 // Adjust the font size proportionally
                          ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/bullet.svg"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      text2,
                      style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontSize: 14 // Adjust the font size proportionally
                          ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/bullet.svg"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      text3,
                      style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontSize: 14 // Adjust the font size proportionally
                          ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/bullet.svg"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      text4,
                      style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontSize: 14 // Adjust the font size proportionally
                          ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Know More",
                          style: GoogleFonts.lexend(
                              color: Color(0xff6318AF),
                              fontSize:
                                  12 // Adjust the font size proportionally
                              ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
