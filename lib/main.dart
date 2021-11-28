import 'package:energy_saver/screens/AddRoom.dart';
import 'package:energy_saver/screens/LoginScreen.dart';
import 'package:energy_saver/screens/RoomScreen.dart';
import 'package:energy_saver/screens/SignupScreen.dart';
import 'package:energy_saver/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dataProviders/AppData.dart';
import 'screens/Homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          AddRoom.id: (context) => AddRoom(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          RoomScreen.id: (context) => RoomScreen(),
        },
      ),
    );
  }
}
