import 'package:flutter/material.dart';
import '../screens_welcome/welcome_learn.dart';
import '../screens_welcome/welcome_practise.dart';
import '../screens_welcome/welcome_help.dart';
import '../constants.dart';
import '../screens_login_registration/login_screen.dart';
import '../components/component_bottom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageSelector extends StatelessWidget {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            //dot indicators
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const WormEffect(
                activeDotColor: kColourBlueMain,
                dotColor: kColourGreyMain,
                dotHeight: 12,
                dotWidth: 12,
                //space between the dots
                spacing: 6,
              ),
            ),
          ),
          SizedBox(
            height: 500,
            //height: MediaQuery.of(context).size.height,
            child: PageView(
              controller: _controller,
              children: [
                WelcomeLearn(),
                WelcomePractise(),
                WelcomeHelp(),
              ],
            ),
          ),
          BottomButton(
            bottomTitle: 'Los geht\'s',
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                )),
          )
        ])));
  }
}
