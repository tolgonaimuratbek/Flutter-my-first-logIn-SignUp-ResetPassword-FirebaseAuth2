import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const String id = 'ChatPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(8),
          child: Text(
            'This works',
          ),
        ),
      ),
    );
  }
}
