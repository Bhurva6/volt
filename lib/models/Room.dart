import 'package:energy_saver/models/DailyEnergy.dart';
import 'package:flutter/cupertino.dart';

class Room {
  String? title;
  IconData? icon;
  List<DailyEnergyData>? data;

  Room({this.data, this.icon, this.title});
}
