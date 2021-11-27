import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomIcon extends StatelessWidget {
  RoomIcon({this.iconData, this.title});
  String? title;
  IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(
          color: Color(0xFFF6A153),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 50,
              color: Colors.orange,
            ),
            Text(
              title!,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: Colors.orange,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
