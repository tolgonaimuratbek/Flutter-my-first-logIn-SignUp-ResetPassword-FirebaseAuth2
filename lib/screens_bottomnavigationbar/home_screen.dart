import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'page_home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome in HomePage'),
      ),
    );
  }
}
