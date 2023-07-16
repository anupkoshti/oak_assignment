import 'package:anup_oak_assignment/screens/login%20screen/login.dart';
import 'package:anup_oak_assignment/screens/login%20screen/namedetails.dart';
import 'package:anup_oak_assignment/widgets/customkeyboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class MyVerify extends StatefulWidget {
  String phone;

  MyVerify({super.key, required this.phone});

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  String enteredOTP = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  void onKeyPressed(String value) {
    setState(() {
      if (value == 'backspace') {
        if (enteredOTP.isNotEmpty) {
          enteredOTP = enteredOTP.substring(0, enteredOTP.length - 1);
        }
      } else {
        enteredOTP += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;

    ///DEFAULT PINTHEME
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: screenHeight * 0.0168,
          color: Colors.black,
          fontWeight: FontWeight.w500),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black)),
      ),
    );

    //FOCUSED PINTHEME
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border(bottom: BorderSide(color: Colors.black)),
    );

    //SUBMITTED PINTHEME
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(color: Colors.red),
    );

    var _isLoading = false;
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
        title: Text(
          "OTP Verification",
          style: GoogleFonts.lexend(
            color: Colors.black,
            fontSize:
                screenHeight * 0.016, // Adjust the font size proportionally
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.08,
                ),
                Text(
                  "We have sent a verification code to",
                  style: GoogleFonts.lexend(
                    color: Color(0xff545454),
                    fontSize: screenHeight *
                        0.016, // Adjust the font size proportionally
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "+91-XXXXXX${widget.phone.substring(5, 9)}",
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: screenHeight *
                            0.016, // Adjust the font size proportionally
                      ),
                    ),
                    SizedBox(
                      width: screenHeight * 0.008,
                    ),
                    Icon(
                      Icons.verified,
                      color: Color(0xff5DCB54),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.all(screenHeight * 0.04),
                  child: Pinput(
                    controller: TextEditingController(text: enteredOTP),
                    onChanged: (value) {
                      // Update enteredOTP when Pinput value changes
                      setState(() {
                        enteredOTP = value;
                      });
                    },
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    keyboardType: TextInputType.none,
                    separator: SizedBox(width: screenHeight * 0.03),
                    //submittedPinTheme: submittedPinTheme,
                    length: 6,
                    showCursor: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenHeight * 0.037, right: screenHeight * 0.037),
                  child: SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.051,
                    child: _isLoading == true
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              var finalotp = enteredOTP.substring(0, 6);
                              print(finalotp);
                              try {
                                setState(() {
                                  _isLoading = true;
                                });
                                PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                        verificationId: LoginPage.verify,
                                        smsCode: finalotp);
                                await auth.signInWithCredential(credential);
                                setState(() {
                                  _isLoading = false;
                                });
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details()),
                                  (route) => false,
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Wrong OTP"),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                print("wrong otp");
                              }

                              /* try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: MyPhone.verify,
                                  smsCode: code);
                          await auth.signInWithCredential(credential);
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'home', (route) => false);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Wrong OTP"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          print("wrong otp");
                        } */
                            },
                            child: Text(
                              "Submit",
                              style: GoogleFonts.lexend(
                                color: Colors.white,
                                fontSize: screenHeight *
                                    0.016, // Adjust the font size proportionally
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
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t receive code? ",
                      style: GoogleFonts.lexend(
                        color: Color(0xff010F07),
                        fontSize: screenHeight *
                            0.016, // Adjust the font size proportionally
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Resend Again.",
                        style: GoogleFonts.lexend(
                          color: Color(0xff6318AF),
                          fontSize: screenHeight *
                              0.016, // Adjust the font size proportionally
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.17,
                ),
                CustomKeyboard(onKeyPressed: onKeyPressed),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
