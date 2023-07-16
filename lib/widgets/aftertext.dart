import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class aftertext extends StatelessWidget {
  String title;
  String image;
  String text;
  aftertext({
    required this.title,
    required this.image,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                image,
                height: 150,
                width: 150,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.lexend(
                        color: Color(0xff6318AF),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      text,
                      softWrap: true,
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
