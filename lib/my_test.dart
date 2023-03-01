import 'package:flutter/material.dart';

class MyTestClass extends StatelessWidget {
  static const String id = 'my_test';

  const MyTestClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test appBar'),
      ),
      body: Center(
        child: Text('This is a test'),
      ),
    );
  }
}
