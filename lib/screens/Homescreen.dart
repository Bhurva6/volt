import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:energy_saver/tabs/ExploreTab.dart';
import 'package:energy_saver/tabs/HomeTab.dart';
import 'package:energy_saver/tabs/ProfileTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = 'homescreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int? selectedIndex;

  void onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return Scaffold(
        backgroundColor: Color(0xFFEEFAFF),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [ExploreTab(), HomeTab(), Profiletab()],
          controller: tabController,
        ),
        bottomNavigationBar: ConvexAppBar(
          activeColor: Color(0xFFF6A153),
          height: 60,
          top: -49,
          backgroundColor: Color(0xFFF6A153),
          curveSize: 117,
          controller: tabController,
          style: TabStyle.fixedCircle,
          items: [
            TabItem(
                icon: Icon(
                  FontAwesomeIcons.globeAsia,
                  color: Colors.white,
                ),
                title: 'Explore'),
            TabItem(
                icon: Image(
                  image: new AssetImage("assets/images/volt_icon.png"),
                  color: null,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                ),
                title: 'Home'),
            TabItem(
                icon: Icon(
                  FontAwesomeIcons.userAlt,
                  color: Colors.white,
                ),
                title: 'Profile')
          ],
        ));
  }
}
