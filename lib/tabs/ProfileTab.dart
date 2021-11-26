import 'package:energy_saver/widgets/AlertWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profiletab extends StatefulWidget {
  const Profiletab({Key? key}) : super(key: key);

  @override
  _ProfiletabState createState() => _ProfiletabState();
}

class _ProfiletabState extends State<Profiletab> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFEEFAFF),
      body: SafeArea(
        child: Column(
          children: [
            AlertWidget(width: width),
          ],
        ),
      ),
    );
  }
}
