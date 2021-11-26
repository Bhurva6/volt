import 'package:energy_saver/models/DailyEnergy.dart';
import 'package:energy_saver/widgets/AlertWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
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
