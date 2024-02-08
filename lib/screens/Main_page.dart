import 'package:authentication_ui/screens/chatList_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:authentication_ui/screens/page1.dart';
import 'package:authentication_ui/screens/page2.dart';
import 'package:authentication_ui/screens/profile_page.dart';
import 'package:authentication_ui/screens/home.dart';




class MainPage extends StatefulWidget {
  final int initialIndex;

  MainPage({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> {
  late PageController _pageController = PageController(initialPage: widget.initialIndex);
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Page1(),
    Page2(),
    HomePage(),
    ChatList(),
    Profile(),
  ];

  List<Color> _iconColors = List.generate(5, (index) => Color(0xFFDECFE2));

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
    Future.delayed(Duration.zero, () {
      setState(() {
        _selectedIndex = widget.initialIndex;
        _iconColors[_selectedIndex] = Color(0xFF7EC4CF);  
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _iconColors[_selectedIndex] = Color(0xFFDECFE2);  
      _selectedIndex = index;
      _iconColors[_selectedIndex] = Color(0xFF7EC4CF);  
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _iconColors[_selectedIndex] = Color(0xFFDECFE2);  
            _selectedIndex = index;
            _iconColors[_selectedIndex] = Color(0xFF7EC4CF);  
          });
        },
        children: _widgetOptions,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 60.0,
        backgroundColor: Color(0xFF7EC4CF),
        items: <Widget>[
          Icon(Icons.volunteer_activism, size: 30, color: _iconColors[0]),
          Icon(Icons.search, size: 30, color: _iconColors[1]),
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