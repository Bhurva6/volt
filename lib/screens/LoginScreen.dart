import 'package:energy_saver/screens/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  static String id = 'login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(String email, String password) async {
    // var url = Uri.parse('https://example.com/whatsit/create');
    // var response =
    //     await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    // print(await http.read(Uri.parse('https://example.com/foobar.txt')));
    Navigator.pushNamed(context, HomeScreen.id);
  }

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
                  'Log In',
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
                  print("${emailController.text},${passwordController.text}");
                  login(emailController.text, passwordController.text);
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
                      child: Text('Log In',
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
