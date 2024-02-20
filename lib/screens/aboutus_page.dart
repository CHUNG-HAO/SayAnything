import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
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
                    title: Text('歷史介紹', textAlign: TextAlign.center),
                    subtitle: Text('Our history...', textAlign: TextAlign.center),
                  ),
                  ListTile(
                    title: Text('指導教授', textAlign: TextAlign.center),
                  ),
                  buildCard(context, 'assets/images/ting.png', '李文廷', 'wtlee@mail.nknu.edu.tw'),
                  ListTile(
                    title: Text('開發成員', textAlign: TextAlign.center),
                  ),
                  buildCard(context, 'assets/images/chung.jpeg', '鍾弘浩', 'chunghao777@gmail.com'),
                  buildCard(context, 'https://example.com/image3.jpg', '談宇容', '@gmail.com'),
                  buildCard(context, 'assets/images/george.png', '林鈺佑', '@gmail.com'),
                  ListTile(
                    title: Text('特別感謝', textAlign: TextAlign.center),
                  ),
                  buildCard(context, 'https://example.com/image5.jpg', '友情協助成員', '@gmail.com'),
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
}