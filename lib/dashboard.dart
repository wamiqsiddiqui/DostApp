import 'package:dostapp/SimpleNavigationWidget.dart';
import 'package:dostapp/caseDetails.dart';
import 'package:dostapp/cases.dart';
import 'package:flutter/material.dart';
import 'sample.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    DashboardNavigator(),
    CasesNavigator(),
    SimpleNavigationWidget(),
    Text(
      'Index 2: Events',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init state");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement_outlined),
            activeIcon: Icon(Icons.announcement),
            label: 'Cases',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline,size: 40,),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert_outlined),
            activeIcon: Icon(Icons.add_alert),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined),
            activeIcon: Icon(Icons.event_note),
            label: 'Events',
          ),
        ],
        unselectedItemColor: Colors.purple,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}
