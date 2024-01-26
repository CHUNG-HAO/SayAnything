import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:authentication_ui/screens/page1.dart';
import 'package:authentication_ui/screens/page2.dart';
import 'package:authentication_ui/screens/chat_page.dart';
import 'package:authentication_ui/screens/profile_page.dart';
import 'package:authentication_ui/screens/home.dart';

class MainPage extends StatefulWidget {
  final int initialIndex;

  MainPage({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Page1(),
    Page2(),
    HomePage(),
    Page3(),
    Page4(),
  ];

  // Create a color list for the icons
  List<Color> _iconColors = List.generate(5, (index) => Color(0xFFDECFE2));

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _selectedIndex = widget.initialIndex;
        _iconColors[_selectedIndex] = Color(0xFF7EC4CF);  // Set the initial selected icon color
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _iconColors[_selectedIndex] = Color(0xFFDECFE2);  // Reset the previous selected icon color
      _selectedIndex = index;
      _iconColors[_selectedIndex] = Color(0xFF7EC4CF);  // Set the new selected icon color
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ClipPath(
              child: IndexedStack(
                index: _selectedIndex,
                children: _widgetOptions,
        ),
      ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 60.0,
        backgroundColor: Color(0xFF7EC4CF),
        items: <Widget>[
          Icon(Icons.volunteer_activism, size: 30, color: _iconColors[0]),
          Icon(Icons.explore, size: 30, color: _iconColors[1]),
          Icon(Icons.home, size: 30, color: _iconColors[2]),
          Icon(Icons.wechat, size: 30, color: _iconColors[3]),
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xFFDECFE2), Color(0xFF7EC4CF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds),
            child: Icon(Icons.person, size: 30, color: _iconColors[4]),
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
