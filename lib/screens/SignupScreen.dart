import 'dart:convert';

import 'package:energy_saver/screens/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  static String id = 'signup';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  void signup(
      String name, String email, String password, String phoneNo) async {
    // Map<String, String> headerMap = {'Content-Type': 'application/json'};
    // Map<String, String> bodyMap = {
    //   'username': name,
    //   "email": email,
    //   "password1": password,
    //   "password2": password,
    //   "phone_number": phoneNo,
    // };
    // var url = Uri.parse(
    //     'https://voltbackend.herokuapp.com/dj-rest-auth/registration/');
    // var response =
    //     await http.post(url, headers: headerMap, body: jsonEncode(bodyMap));
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    Navigator.pushNamed(context, HomeScreen.id);
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEEFAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 80,
              ),
              Center(
                child: Text(
                  'Sign Up',
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
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Name',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Color(
                        0xFFF6A153,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(FontAwesome.user),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Color(0xFFF6A153),
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Color(0xFFF6A153),
                        width: 1.0,
                      ),
                    ),
                    enabled: true,
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'E-mail',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Color(
                        0xFFF6A153,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Feather.mail),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Color(0xFFF6A153),
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Color(0xFFF6A153),
                        width: 1.0,
                      ),
                    ),
                    enabled: true,
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Phone Number',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Color(
                        0xFFF6A153,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: phoneNoController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(FontAwesome.phone),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Color(0xFFF6A153),
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Color(0xFFF6A153),
                        width: 1.0,
                      ),
                    ),
                    enabled: true,
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Password',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Color(
                        0xFFF6A153,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Entypo.key),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Color(0xFFF6A153),
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Color(0xFFF6A153),
                        width: 1.0,
                      ),
                    ),
                    enabled: true,
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  signup(nameController.text, emailController.text,
                      passwordController.text, phoneNoController.text);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Container(
                    width: 0.8 * width,
                    decoration: BoxDecoration(
                        color: Color(0xFFF6A153),
                        borderRadius: BorderRadius.circular(8.0),
                        border:
                            Border.all(color: Color(0xFFF6A153), width: 1.0)),
                    child: Center(
                      child: Text('Sign Up',
                          style: GoogleFonts.roboto(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
