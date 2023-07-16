import 'package:anup_oak_assignment/screens/homescreen/homescreen.dart';
import 'package:anup_oak_assignment/screens/orderscreen.dart';
import 'package:anup_oak_assignment/screens/profilescreen.dart';
import 'package:anup_oak_assignment/screens/wishscreend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final tabs = [
    const Center(
      child: HomeScreen(),
    ),
    const Center(
      child: WishScreen(),
    ),
    Center(
      child: OrderScreen(),
    ),
    Center(
      child: ProfileScreen(),
    ),
  ];
  var navigationBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    //final navigationBarIndex = Provider.of<NavigationViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: tabs[navigationBarIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: BottomNavigationBar(
          iconSize: 30,
          backgroundColor: Color(0xffF1F1F1),
          onTap: (index) {
            changeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: GoogleFonts.lexend(
              color: Colors.black,
              fontSize: 15.0 // Adjust the font size proportionally
              ),
          selectedLabelStyle: GoogleFonts.lexend(
              color: Colors.black,
              fontSize: 15.0 // Adjust the font size proportionally
              ),
          currentIndex: navigationBarIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                navigationBarIndex == 0 ? Icons.home : Icons.home_outlined,
                color: navigationBarIndex == 0
                    ? Color(0xff6318AF)
                    : Color(0xff8E8E8E),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                navigationBarIndex == 1
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                color: navigationBarIndex == 1
                    ? Color(0xff6318AF)
                    : Color(0xff8E8E8E),
              ),
              label: "WishList",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                navigationBarIndex == 2
                    ? Icons.dining_rounded
                    : Icons.dining_outlined,
                color: navigationBarIndex == 2
                    ? Color(0xff6318AF)
                    : Color(0xff8E8E8E),
              ),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                navigationBarIndex == 3 ? Icons.person : Icons.person_outline,
                color: navigationBarIndex == 3
                    ? Color(0xff6318AF)
                    : Color(0xff8E8E8E),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        child: SvgPicture.asset(
          "assets/floating button.svg",
          height: 65,
          width: 65,
        ),
      ),
    );
  }

  changeIndex(int index) {
    navigationBarIndex = index;
    setState(() {});
  }
}
