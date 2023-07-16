import 'dart:async';
// import 'package:anup_oak_assignment/screens/onboarding/onboarding_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../onboarding/onboarding_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideLeftAnimation;
  late Timer _timer;
  int _counter = 0;
  bool _isFirstTextVisible = true;
  bool _isSecondWidgetVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _slideLeftAnimation = Tween<Offset>(
      begin: const Offset(0.5, 1.5),
      end: Offset(0.0, 0.0),
    ).animate(_animationController);

    _timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _counter++;
        _isFirstTextVisible = !_isFirstTextVisible;
        if (_counter == 1) {
          _startSecondWidgetAnimation();
        }
      });
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && _counter == 1) {
        _navigateToNextScreen();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startSecondWidgetAnimation() {
    setState(() {
      _isSecondWidgetVisible = true;
    });
    _animationController.forward();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _isFirstTextVisible ? Colors.white : const Color(0xff6318AF),
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/splash.svg',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _isFirstTextVisible
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/the logo.svg',
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          'Welcome',
                          style: GoogleFonts.capriola(
                            color: const Color(0xffF7E5B7),
                            fontSize: 32,
                          ),
                          key: const ValueKey<int>(1),
                        ),
                      ],
                    )
                  : AnimatedOpacity(
                      opacity: _isSecondWidgetVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: SlideTransition(
                        position: _slideLeftAnimation,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/the logo.svg',
                              height: 100,
                              width: 100,
                            ),
                            Text(
                              'Craft My Plate',
                              style: GoogleFonts.capriola(
                                color: const Color(0xffF7E5B7),
                                fontSize: 32,
                              ),
                              key: const ValueKey<int>(2),
                            ),
                            Text(
                              'You customise, We cater',
                              style: GoogleFonts.courgette(
                                color: const Color(0xffD5B67D),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
