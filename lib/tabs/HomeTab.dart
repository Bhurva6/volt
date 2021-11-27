import 'package:energy_saver/models/DailyEnergy.dart';
import 'package:energy_saver/models/Room.dart';
import 'package:energy_saver/screens/AddRoom.dart';
import 'package:energy_saver/widgets/AlertWidget.dart';
import 'package:energy_saver/widgets/RoomIcon.dart';
import 'package:flutter/material.dart';
import 'package:energy_saver/widgets/CustomBadge.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late List<DailyEnergyData> _chartData;
  late List<Room> _roomData;
  @override
  void initState() {
    _chartData = getDailyData();
    _roomData = getRoomData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _roomData = getRoomData();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFEEFAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AlertWidget(width: width),
              Text('Hi John'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Center(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                    color: Color(0xFFF6A153), width: 1.0)),
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.symmetric(
                                horizontal: 26, vertical: 12),
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
                                  xValueMapper: (DailyEnergyData data, _) =>
                                      data.time,
                                  yValueMapper: (DailyEnergyData data, _) =>
                                      data.power,
                                  dataLabelSettings:
                                      DataLabelSettings(isVisible: true),
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
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                    color: Color(0xFFF6A153), width: 1.0)),
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 12),
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
                                  xValueMapper: (DailyEnergyData data, _) =>
                                      data.time,
                                  yValueMapper: (DailyEnergyData data, _) =>
                                      data.power,
                                  dataLabelSettings:
                                      DataLabelSettings(isVisible: true),
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
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                    color: Color(0xFFF6A153), width: 1.0)),
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 12),
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
                                  xValueMapper: (DailyEnergyData data, _) =>
                                      data.time,
                                  yValueMapper: (DailyEnergyData data, _) =>
                                      data.power,
                                  dataLabelSettings:
                                      DataLabelSettings(isVisible: true),
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
                    ],
                  ),
                ),
              ),

              Flexible(
                child: Container(
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _roomData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          child: RoomIcon(
                            iconData: _roomData[index].icon,
                            title: _roomData[index].title,
                          ),
                        );
                      }),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AddRoom.id);
                },
                child: Container(
                  width: 0.9 * width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(color: Color(0xFFF6A153), width: 1.0),
                  ),
                  child: Center(
                    child: Text(
                      '+ Add a room',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              // Row(
              //   children: [
              //     RoomIcon(
              //       iconData: MaterialCommunityIcons.sofa,
              //       title: 'Bed',
              //     ),
              //   ],
              // )
            ],
          ),
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

List<Room> getRoomData() {
  List<Room> roomdata = [
    Room(
      title: 'Bed',
      icon: MaterialCommunityIcons.sofa,
    ),
    Room(
      title: 'Bed',
      icon: MaterialCommunityIcons.sofa,
    ),
    Room(
      title: 'Bed',
      icon: MaterialCommunityIcons.sofa,
    ),
    Room(
      title: 'Bed',
      icon: MaterialCommunityIcons.sofa,
    ),
  ];
  return roomdata;
}
