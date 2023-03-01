import 'package:flutter/material.dart';
import '../components/component_image_title_text.dart';

class WelcomePractise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WelcomeImageTitleText(
            myImage: AssetImage('images/welcome2.png'),
            myTitle: 'Übe kostenlos mit der DeZone Gemeinschaft',
            myText:
                'Verbessere deine Sprachfertigkeiten, indem du Verbindung mit '
                'vielen Deutschlernenden weltweit  aufbaust.'));
  }
}
