import 'package:energy_saver/widgets/AlertWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRoom extends StatefulWidget {
  static String id = 'addroom';
  const AddRoom({Key? key}) : super(key: key);

  @override
  _AddRoomState createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFEEFAFF),
      body: Column(
        children: [
          AlertWidget(width: width),
          Text(
            'Add Room!',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 40, color: Colors.orange),
            ),
          )
        ],
      ),
    );
  }
}
