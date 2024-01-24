import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:authentication_ui/screens/page1.dart';
import 'package:authentication_ui/screens/page2.dart';
import 'package:authentication_ui/screens/page3.dart';
import 'package:authentication_ui/screens/page4.dart';
import 'package:authentication_ui/screens/home.dart';


class MainPage extends StatefulWidget {
  final int initialIndex;

  MainPage({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[ // Remove const
    Page1(),
    Page2(),
    HomePage(),
    Page3(),
    Page4(),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _selectedIndex = widget.initialIndex;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 60.0,
        backgroundColor: const Color.fromARGB(126, 68, 137, 255),
        items: <Widget>[
          Icon(Icons.explore, size: 30),
          Icon(Icons.explore, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.message, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
