import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutus extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();

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
              title: Text('About Us'),
              backgroundColor: Colors.transparent,
              elevation: 0, 
              automaticallyImplyLeading: false,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  ListTile(
                    title: Text('Origin👍', textAlign: TextAlign.center),
                    subtitle: Text('Our history...', textAlign: TextAlign.center),
                  ),
                  ListTile(
                    title: Text('Professor👨‍🏫', textAlign: TextAlign.center),
                  ),
                  buildCard(context, 'assets/images/ting.png', '李文廷', 'wtlee@mail.nknu.edu.tw'),
                  ListTile(
                    title: Text('Developer👨‍🎓👩‍🎓👨‍🏫', textAlign: TextAlign.center),
                  ),
                  buildCard(context, 'assets/images/chung.jpeg', '鍾弘浩', 'chunghao777@gmail.com'),
                  buildCard(context, 'assets/images/T.png', '談宇容', 'sylvia15334@gmail.com'),
                  buildCard(context, 'assets/images/george.png', '林鈺佑', 'george920102@gmail.com'),
                  ListTile(
                    title: Text('特別感謝', textAlign: TextAlign.center),
                  ),
                  buildCard(context, 'https://example.com/image5.jpg', '友情協助成員', '@gmail.com'),
                  ListTile(
                    title: Text('問題回報', textAlign: TextAlign.center),
                  ),
                  Form(
                    key: _formKey,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _subjectController,
                              decoration: InputDecoration(
                                labelText: 'Subject',
                                focusColor: Color(0xFF7EC4CF), // Set the focus color here
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a subject';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _bodyController,
                              decoration: InputDecoration(
                                labelText: 'Body',
                                focusColor: Color(0xFF7EC4CF), // Set the focus color here
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a body';
                                }
                                return null;
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                                  sendEmail(context, 'Subject', 'Body');
                                }
                              },
                              child: Text('Submit'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF7EC4CF)), // Set the button color here
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String imageUrl, String title, String email) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(imageUrl),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
                child: Text(title, textAlign: TextAlign.center),
              ),
              Text(' $email', textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  void sendEmail(BuildContext context, String subject, String body) async {
  final String email = 'chunghao777@gmail.com';
  final Uri params = Uri(
    scheme: 'mailto',
    path: email,
    query: 'subject=$subject&body=$body',
  );

  String url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Could not launch $url. Please install a mail app.'),
      ),
    );
  }
}
}