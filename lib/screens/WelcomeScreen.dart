import 'package:energy_saver/screens/LoginScreen.dart';
import 'package:energy_saver/screens/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'welcome';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEEFAFF),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/volt_big.png',
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Volt',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Color(
                    0xFFF6A153,
                  ),
                ),
              ),
            ),
            Text(
              'Powering you',
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                fontSize: 20,
                color: Color(
                  0xFFF6A153,
                ),
              )),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              child: Container(
                width: 0.8 * width,
                decoration: BoxDecoration(
                    color: Color(0xFFF6A153),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Color(0xFFF6A153), width: 1.0)),
                child: Center(
                  child: Text('Log In',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SignupScreen.id);
              },
              child: Container(
                width: 0.8 * width,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Color(0xFFF6A153), width: 1.0)),
                child: Center(
                  child: Text('Sign Up',
                      style: GoogleFonts.roboto(
                        textStyle:
                            TextStyle(color: Color(0xFFF6A153), fontSize: 20),
                      )),
                ),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
              ),
            )
          ],
        ),
      )),
    );
  }
}
