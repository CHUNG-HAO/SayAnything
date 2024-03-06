import 'package:SayAnything/screens/fade_animationtest.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Center(
              child: SizedBox(
                child: Column(
                  children: [
                    FadeInAnimation(
                      delay: 1,
                      child: Container(
                        height: 200,
                        width: 200,
                        child: rive.RiveAnimation.asset(
                          'assets/animation/3.riv',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}