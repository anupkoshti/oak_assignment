import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'otpscreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String verify = "";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phonecontroller = TextEditingController();
  TextEditingController countrycodecontroller = TextEditingController();
  var phone = "";
  bool _isLoading = false;

  @override
  void initState() {
    countrycodecontroller.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/login page.svg",
                      width: screenWidth * 1,
                    ),
                    Positioned(
                      top: screenHeight * 0.05,
                      right: screenWidth * 0.31,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/logo.svg'),
                          Text(
                            "CraftMyPlate",
                            style: GoogleFonts.lexend(
                              color: Colors.white,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Login or Signup",
                        style: GoogleFonts.lexend(
                          color: Color(0xff787878),
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Text(
                            "+91",
                            style: GoogleFonts.lexend(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              phone = value;
                            },
                            maxLength: 10,
                            decoration: InputDecoration(
                              hintText: "Enter Phone Number",
                              hintStyle: GoogleFonts.lexend(
                                color: Color(0xff787878),
                                fontSize: 14,
                              ),
                              counterText: "",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 12.0,
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                _isLoading == true
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });

                          try {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber:
                                  '${countrycodecontroller.text + phone}',
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text("Wrong phone number entered $e"),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                setState(() {
                                  _isLoading = false;
                                });
                              },
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                LoginPage.verify = verificationId;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyVerify(
                                      phone: phone,
                                    ),
                                  ),
                                );
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {
                                setState(() {
                                  _isLoading = false;
                                });
                              },
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Wrong phone number entered $e"),
                                backgroundColor: Colors.green,
                              ),
                            );
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(screenWidth * 0.9, screenHeight * 0.06),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.02),
                          ),
                          backgroundColor: Color(0xFF6318AF),
                        ),
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : Text(
                                "Continue",
                                style: GoogleFonts.lexend(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.035,
                                ),
                              ),
                      ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.02),
              child: Text(
                "By continuing, you agree to our\nTerms of Service Privacy Policy",
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  color: Color(0xff7B7B7B),
                  fontSize: screenWidth * 0.035,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
