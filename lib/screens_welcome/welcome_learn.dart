import 'package:flutter/material.dart';
import '../components/component_image_title_text.dart';

class WelcomeLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      WelcomeImageTitleText(
          myImage: AssetImage('images/welcome1.png'),
          myTitle: 'Lerne online außerhalb der Klassenräume',
          myText: 'Lerne auf die Weise, die für dich am besten geeignet ist. '
              'Ob Anfänger oder Fortgeschrittene, wir haben das '
              'Richtige für dich.'),
    ]));
  }
}
