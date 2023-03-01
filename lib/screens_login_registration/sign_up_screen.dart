import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/component_title_text.dart';
import '../components/reusable_widgets.dart';
import '../constants.dart';
import '../menu_screen.dart';
import '../screens_login_registration/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmedPasswordTextController =
      TextEditingController();

  @override
  void dispose() {
    _userNameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _confirmedPasswordTextController.dispose();
    super.dispose();
  }

  //check if 2 password match
  bool passwordConfirmed() {
    if (_passwordTextController.text.trim() ==
        _confirmedPasswordTextController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  //check if email is an email
  bool mailCheck() {
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+[a-z]")
        .hasMatch(_emailTextController.text)) {
      return true;
    } else {
      return false;
    }
  }

  //if passwordConfirmed & mailCheck true & UserName not empty
  Future signUp() async {
    //success case
    try {
      if (passwordConfirmed() &&
          mailCheck() &&
          _userNameTextController.text.isNotEmpty) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text.trim(),
        );
      }
      //error case
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    30,
                    MediaQuery.of(context).size.height * 0.08,
                    30,
                    MediaQuery.of(context).size.height * 0.04),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    ReusableTitleWithText(
                        myTitle: 'Konto anlegen ',
                        myText:
                            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy'),
                    const SizedBox(height: 50),
                    reusableTextField('Name', Icons.person_outline, false,
                        _userNameTextController, TextInputAction.next),
                    const SizedBox(height: 15),
                    reusableTextField(
                        'E-Mail-Adresse eingeben',
                        Icons.mail_outline,
                        false,
                        _emailTextController,
                        TextInputAction.next),
                    const SizedBox(height: 15),
                    reusableTextField('Password eingeben', Icons.lock_outline,
                        true, _passwordTextController, TextInputAction.next),
                    const SizedBox(height: 15),
                    reusableTextField(
                        'Password bestätigen',
                        Icons.lock_outline,
                        true,
                        _confirmedPasswordTextController,
                        TextInputAction.done),
                    const SizedBox(height: 55),
                    signInSignUpResetPasswordButton(context, 'KONTO ANLEGEN',
                        () {
                      signUp();
                    }),
                    signUpOption(context),
                  ],
                ),
              ),
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
      const Text('Hast du bereits ein Konto? ', style: kBodyTextStyleNormal),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: const Text('Anmelden', style: kBodyTextStyleBold),
      ),
    ],
  );
}
