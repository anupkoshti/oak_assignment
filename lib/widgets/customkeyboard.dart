import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomKeyboard extends StatelessWidget {
  final Function(String) onKeyPressed;

  CustomKeyboard({required this.onKeyPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffD2D3DB),
      height: 430,
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 117 / 47,
        children: List.generate(12, (index) {
          if (index == 9) {
            // Skip index 9
            return Container();
          } else if (index == 10) {
            // Add 0 button
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                minWidth: 117,
                height: 47,
                color: Colors.white,
                onPressed: () {
                  onKeyPressed('0');
                },
                child: Text(
                  '0',
                  style: GoogleFonts.lexend(
                    color: Colors.black,
                    fontSize: 16, // Adjust the font size proportionally
                  ),
                ),
              ),
            );
          } else if (index == 11) {
            // Add backspace button
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                minWidth: 117,
                height: 47,
                //color: Colors.white,
                onPressed: () {
                  onKeyPressed('backspace');
                },
                child: Icon(Icons.backspace_outlined, color: Color(0xff50555C)),
              ),
            );
          } else {
            int number = index < 3 ? index + 1 : index + 1;
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                minWidth: 117,
                height: 47,
                color: Colors.white,
                onPressed: () {
                  onKeyPressed(number.toString());
                },
                child: Text(
                  number.toString(),
                  style: GoogleFonts.lexend(
                    color: Colors.black,
                    fontSize: 16, // Adjust the font size proportionally
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
