import 'package:energy_saver/dataProviders/AppData.dart';
import 'package:energy_saver/globalVariables.dart';
import 'package:energy_saver/models/Room.dart';
import 'package:energy_saver/widgets/AlertWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddRoom extends StatefulWidget {
  static String id = 'addroom';
  const AddRoom({Key? key}) : super(key: key);

  @override
  _AddRoomState createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  final roomNameController = TextEditingController();
  final powerController = TextEditingController();
  Roomtype? _roomtype;
  Room room =
      Room(title: 'hh', roomtype: Roomtype.LIVINGROOM, normalpower: 2000);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    room!.roomtype = Roomtype.LIVINGROOM;
  }

  IconData? iconData = SimpleLineIcons.question;

  @override
  Widget build(BuildContext context) {
    room!.roomtype = Roomtype.LIVINGROOM;
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
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: roomNameController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFF6A153),
                    width: 1.0,
                  ),
                ),
                labelText: "Room Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                  labelText: 'Room Type', prefixIcon: Icon(iconData)),
              onChanged: (Roomtype? newValue) {
                setState(() {
                  print(newValue.toString());
                  _roomtype = newValue;
                  iconData = getIcon(newValue!);
                });
              },
              items: Roomtype.values.map((Roomtype roomtype) {
                return DropdownMenuItem<Roomtype>(
                    value: roomtype, child: Text(describeEnum(roomtype)));
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: powerController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFF6A153),
                    width: 1.0,
                  ),
                ),
                labelText: "Power in kilowats",
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          MaterialButton(
            onPressed: () {
              Provider.of<AppData>(context, listen: false).addRoom(Room(
                  icon: iconData,
                  title: roomNameController.text,
                  roomtype: _roomtype,
                  normalpower: double.parse(powerController.text)));
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
            padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
            color: Color(0xFFF6A153),
          ),
        ],
      ),
    );
  }
}

IconData getIcon(Roomtype roomtype) {
  IconData? iconData;
  if (roomtype == Roomtype.BATHROOM) {
    return FontAwesomeIcons.bath;
  } else if (roomtype == Roomtype.BEDROOM) {
    return FontAwesomeIcons.bed;
  } else if (roomtype == Roomtype.DINING) {
    return MaterialIcons.brunch_dining;
  } else if (roomtype == Roomtype.KITCHEN) {
    return MaterialIcons.kitchen;
  } else if (roomtype == Roomtype.LIVINGROOM) {
    return MaterialCommunityIcons.sofa;
  } else {
    return Ionicons.game_controller;
  }
}
