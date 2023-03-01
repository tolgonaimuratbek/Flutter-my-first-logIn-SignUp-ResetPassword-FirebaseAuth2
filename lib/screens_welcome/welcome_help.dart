import 'package:flutter/material.dart';
import '../components/component_image_title_text.dart';

class WelcomeHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WelcomeImageTitleText(
            myImage: AssetImage('images/welcome3.png'),
            myTitle: 'Lass dir beim Lernen der deutschen Sprache helfen',
            myText:
                'Finde zertifizierte Lehkräfte mit nachgewiesener Erfahrung. '));
  }
}
