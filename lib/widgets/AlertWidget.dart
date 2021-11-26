import 'package:flutter/material.dart';
import 'CustomBadge.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Badge(
      top: 15,
      right: 19,
      value: '1',
      child: Container(
        width: 65,
        height: 68,
        margin: EdgeInsets.fromLTRB(0.8 * width, 20, 20, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Color(0xFFF6A153), width: 1.0)),
        child: Image.asset(
          'assets/images/volt.png',
          height: 55,
          width: 65,
        ),
      ),
    );
  }
}
