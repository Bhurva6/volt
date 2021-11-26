import 'package:energy_saver/models/DailyEnergy.dart';
import 'package:energy_saver/widgets/AlertWidget.dart';
import 'package:flutter/material.dart';
import 'package:energy_saver/widgets/CustomBadge.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late List<DailyEnergyData> _chartData;
  @override
  void initState() {
    _chartData = getDailyData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFEEFAFF),
      body: SafeArea(
        child: Column(
          children: [
            AlertWidget(width: width),
            Text('Hi John'),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Color(0xFFF6A153), width: 1.0)),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
              child: SfCartesianChart(
                title: ChartTitle(
                    alignment: ChartAlignment.center,
                    text: 'Total energy consumed today'),
                series: <ChartSeries>[
                  ColumnSeries<DailyEnergyData, String>(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7)),
                    color: Color(0xFFA8DAAA),
                    dataSource: _chartData,
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
            )
          ],
        ),
      ),
    );
  }

  List<DailyEnergyData> getDailyData() {
    List<DailyEnergyData> dailyData = [
      DailyEnergyData(time: '00:00hrs', power: 3000),
      DailyEnergyData(time: '05:00hrs', power: 1000),
      DailyEnergyData(time: '10:00hrs', power: 1500),
      DailyEnergyData(time: '15:00hrs', power: 900),
      DailyEnergyData(time: '20:00hrs', power: 3100),
    ];
    return dailyData;
  }
}
