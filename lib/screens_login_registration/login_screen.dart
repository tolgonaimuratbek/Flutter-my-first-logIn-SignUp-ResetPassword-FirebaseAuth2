import 'package:de_zone/screens_bottomnavigationbar/home_screen.dart';
import 'package:de_zone/screens_login_registration/reset_password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens_login_registration/sign_up_screen.dart';
import '../components/component_title_text.dart';
import '../components/reusable_widgets.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: appWidth,
        height: appHeight,
        ////wrap Column with SingleChildScrollView in order to have no bottom overflow error when keyboard pups up & to be able to scroll the buttons
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Padding(
                //EdgeInsets.fromLTRB: left, top, right bottom
                padding: EdgeInsets.fromLTRB(
                    30,
                    MediaQuery.of(context).size.height * 0.08,
                    30,
                    MediaQuery.of(context).size.height * 0.04),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    ReusableTitleWithText(
                      myTitle: 'Schön, dass du wieder hier bist!',
                      myText:
                          'Gebe deine E-Mail-Adresse ein, um dich bei deinem Konto anzumelden.',
                    ),
                    reusableWidgetImage('images/login.png'),
                    reusableTextField(
                        'E-Mail-Adresse eingeben',
                        Icons.mail_outline,
                        false,
                        _emailTextController,
                        TextInputAction.next),
                    const SizedBox(height: 15),
                    reusableTextField('Password eingeben', Icons.lock_outline,
                        true, _passwordTextController, TextInputAction.done),
                    const SizedBox(height: 45),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPasswordScreen()));
                      },
                      child: const Text('Passwort vergessen?',
                          style: kBodyTextStyleBold),
                    ),
                    const SizedBox(height: 10),
                    signInSignUpResetPasswordButton(context, 'ANMELDEN', () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                        //error case
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    }),
                    signUpOption(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('Du besitzt noch kein Konto? ', style: kBodyTextStyleNormal),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        },
        child: const Text('Konto anlegen', style: kBodyTextStyleBold),
      ),
    ],
  );
}
