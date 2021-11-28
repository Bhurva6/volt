import 'package:energy_saver/globalVariables.dart';
import 'package:energy_saver/models/DailyEnergy.dart';
import 'package:flutter/cupertino.dart';

class Room {
  String? title;
  IconData? icon;
  List<DailyEnergyData>? data;
  Roomtype? roomtype;
  double? normalpower;

  Room({this.data, this.icon, this.title, this.roomtype, this.normalpower});
}
