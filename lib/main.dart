import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import '../screens_welcome/page_selector.dart';

void main() async {
  //make sure Firebase is initialised before run the application
  WidgetsFlutterBinding.ensureInitialized();
  //save Firebase.initializeApp();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kColourWhiteNormal, //body background colour
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: kColourBlueMain, //e.g. appbar background color
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: kColourBlueMain, //body text color
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: kColourBlueMain),
      ),
      home: PageSelector(),
    );
  }
}
