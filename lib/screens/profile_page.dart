import 'dart:async';

import 'package:authentication_ui/screens/fade_animationtest.dart';
import 'package:authentication_ui/screens/login_page.dart';
import 'package:authentication_ui/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:authentication_ui/screens/edit_description.dart';


import 'package:authentication_ui/screens/edit_name.dart';

import '../services/user.dart';
import '../services/user_data.dart';


class Profile extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;
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
              title: Text('Profile'),
              backgroundColor: Colors.transparent, 
              elevation: 0, 
              automaticallyImplyLeading: false,
            ),
              Icon(
                Icons.person,
                size: 100, // adjust the size as needed
                color: user.gender == 'Male' ? Colors.blue : (user.gender == 'Female' ? Colors.pink : Colors.grey),
              ),
            buildUserInfoDisplay(user.name, 'Name', EditNameFormPage()),
            buildUserInfoDisplay(user.email, 'Email', null),
            Expanded(
              child: buildAbout(user),
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget? editPage) =>
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: editPage != null ? () {
                              navigateSecondPage(editPage);
                            } : null, // if editPage is null, onPressed will be null
                            child: Text(
                              getValue,
                              style: TextStyle(fontSize: 16, height: 1.4),
                            ))),
                    if (editPage != null) // if editPage is not null, show the arrow icon
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 40.0,
                      )
                  ]))
            ],
          ));

  // Widget builds the About Me Section
  Widget buildAbout(User user) => Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tell Us About Yourself',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 1),
          Container(
              width: 350,
              height: 150,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          navigateSecondPage(EditDescriptionFormPage());
                        },
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  user.aboutMeDescription,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.4,
                                  ),
                                ))))),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40.0,
                )
              ])),
              FadeInAnimation(
              delay: 2.7,
              child: CustomElevatedButton(
                message: "Logout",
                
                function: () {
                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                },
                color: Color(0xFF7EC4CF),
              ),
            ),
            ],
      ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}