import 'package:energy_saver/models/DailyEnergy.dart';
import 'package:energy_saver/models/Room.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RoomScreen extends StatefulWidget {
  static String id = 'roomscreen';
  final Room? roomdata;
  RoomScreen({this.roomdata});

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  List<DailyEnergyData>? _data;
  @override
  void initState() {
    _data = getDailyData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.roomdata!.title!),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Color(0xFFF6A153), width: 1.0)),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
              child: SfCartesianChart(
                title: ChartTitle(
                    alignment: ChartAlignment.center,
                    text: 'Total energy consumed today'),
                series: <ChartSeries>[
                  LineSeries<DailyEnergyData, String>(
                    color: Color(0xFFA8DAAA),
                    dataSource: _data!,
                    xValueMapper: (DailyEnergyData data, _) => data.time,
                    yValueMapper: (DailyEnergyData data, _) => data.power,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  ),
                ],
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    title: AxisTitle(text: 'Power Consumed')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DailyEnergyData> getDailyData() {
    List<DailyEnergyData> dailyData = [
      DailyEnergyData(time: '00:00hrs', power: 2.5),
      DailyEnergyData(time: '05:00hrs', power: 2.1),
      DailyEnergyData(time: '10:00hrs', power: 1.6),
      DailyEnergyData(time: '15:00hrs', power: 0.9),
      DailyEnergyData(time: '20:00hrs', power: 3.1),
    ];
    return dailyData;
  }
}
