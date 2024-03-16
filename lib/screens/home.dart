import 'package:SayAnything/screens/fade_animationtest.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:SayAnything/services/API_services.dart';
import 'package:SayAnything/screens/loading_page.dart';

final matchApiService = MatchApiService();

class UserIdService {
  static Future<String> getCurrentUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId') ?? 'default_value';
    return userId;
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFDECFE2), Color(0xFF7EC4CF)],
              ),
            ),
            child: Column(
              children: [
                AppBar(
                  title: Text('Pair'),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Expanded(
                  child: Center(
                    child: FadeInAnimation(
                      delay: 1,
                      child: Container(
                        height: 400,
                        width: screenWidth,
                        child: rive.RiveAnimation.asset(
                          'assets/animation/2.riv',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInAnimation(
                  delay: 1,
                  child: Container(
                    height: 300,
                    width: screenWidth, 
                    child: rive.RiveAnimation.asset(
                      'assets/animation/hand.riv',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                SizedBox(height: 20), 
                FloatingActionButton(
                  onPressed: () async {
                    String userId = await UserIdService.getCurrentUserId();

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return LoadingPage();
                      },
                    );

                    await matchApiService.requestMatch(userId);

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.navigation),
                  backgroundColor: Color.fromARGB(255, 244, 246, 247),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}