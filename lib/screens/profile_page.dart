import 'package:authentication_ui/screens/fade_animationtest.dart';
import 'package:authentication_ui/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:authentication_ui/screens/authentication_ui.dart';

class Profile extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Profile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _isEditing = false;
  final _nameController = TextEditingController();
  final _mailController = TextEditingController();
  final _genderController = TextEditingController();
  final _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();


    _nameController.text = '軟體工程與管理學系鍾弘浩';
    _mailController.text = 'xxx@mail.nknu.edu.tw';
    _genderController.text = 'Male';
     _bioController.text = '這裡是你的自我介紹';
  }

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
              title: Text('Profile'),
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _isEditing = !_isEditing;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 50),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: _genderController.text == 'Male' ? const Color.fromARGB(255, 114, 187, 246) : const Color.fromARGB(255, 248, 122, 164),
                            child: Icon(
                              Icons.person,
                              size: 50, // adjust the size as needed
                              color: Colors.white, // adjust the color as needed
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('UserName', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              enabled: _isEditing,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('Gmail', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              controller: _mailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              enabled: false,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('Bio', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), // Add this line
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width * 1, // 80% of screen width
                            height: MediaQuery.of(context).size.height * 0.2, // 20% of screen height
                            child: TextField(
                              controller: _bioController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              maxLines: null, // allow as many lines as the user needs
                              enabled: _isEditing,
                            ),
                          ),
                          SizedBox(height: 10),
                          FadeInAnimation(
                            delay: 2.7,
                            child: CustomElevatedButton(
                              message: "Logout",
                              function: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AuthenticationUI()),
                                );
                              },
                              color: Color(0xFF7EC4CF),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}