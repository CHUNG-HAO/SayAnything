import 'package:authentication_ui/screens/chat_page.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  ChatList({Key? key}) : super(key: key);

  final List<String> chatRooms = [
    'Chat Room 1',
    'Chat Room 2',
    'Chat Room 3',
    // Add more chat rooms here
  ];

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
              title: Text('Chat'),
              backgroundColor: Colors.transparent, 
              elevation: 0, 
              automaticallyImplyLeading: false,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chatRooms.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      child: ListTile(
                        title: Text(chatRooms[index]),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChatPage()),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}