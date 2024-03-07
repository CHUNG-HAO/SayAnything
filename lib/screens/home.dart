import 'package:SayAnything/screens/fade_animationtest.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

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
                SizedBox(height: 20),  // Add some space above the button
                ElevatedButton(
                  onPressed: () {

                  },
                  child: Text('PAIR'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}