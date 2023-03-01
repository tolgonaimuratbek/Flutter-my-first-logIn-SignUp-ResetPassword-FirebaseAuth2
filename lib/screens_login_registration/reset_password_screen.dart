import 'package:de_zone/screens_login_registration/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/component_title_text.dart';
import '../components/reusable_widgets.dart';
import '../constants.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: appWidth,
        height: appHeight,
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
                      myTitle: 'Neues Passwort erstellen',
                      myText:
                          'Gebe deine E-Mail-Adresse und ein neues Passwort ein, um zu deinem Konto zurückzukehren.',
                    ),
                    reusableWidgetImage('images/forgotPassword.png'),
                    reusableTextField(
                        'E-Mail-Adresse eingeben',
                        Icons.mail_outline,
                        false,
                        _emailTextController,
                        TextInputAction.done),
                    const SizedBox(height: 95),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text(
                        'Zurück zur Anmeldeseite',
                        style: kBodyTextStyleBold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    signInSignUpResetPasswordButton(
                        context, 'Password zurücksetzen', () {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(
                              email: _emailTextController.text)
                          //after reset code send to the email, we go back to login page
                          .then((value) => Navigator.pop(context));
                    })
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
