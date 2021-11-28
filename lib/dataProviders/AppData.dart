import 'package:energy_saver/models/Room.dart';
import 'package:flutter/cupertino.dart';

class AppData extends ChangeNotifier {
  List<Room>? roomlist;
  void addRoom(Room room) {
    roomlist!.add(room);
    notifyListeners();
  }

  void updateRoomList(List<Room> newroomlist) {
    roomlist = newroomlist;
    notifyListeners();
  }
}
