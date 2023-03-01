import 'package:flutter/material.dart';
import '../constants.dart';

Image reusableWidgetImage(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 180,
    height: 180,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller, TextInputAction textInputAction) {
  return TextField(
    autofocus: false,
    controller: controller,
    //if isPasswordType - obscure the text
    obscureText: isPasswordType,
    //if not isPasswordType - enable Suggestions & do autocorrection
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: kColourBlueMain,
    textInputAction: textInputAction,
    //Styling
    decoration: InputDecoration(
      //left, top, right, bottom
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      prefixIcon: Icon(
        icon,
        color: kColourBlueMain, //icon colour
      ),
      labelText: text,
      labelStyle: const TextStyle(color: kColourBlueMain),
      //text colour
      filled: true,
      //floatingLabelBehavior commented out - want the user see above by typing f.e. password - appears enter password
      //floatingLabelBehavior: FloatingLabelBehavior.never,
      //focusedBorder - the the currently chosen one
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: kColourPurpleMain,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignUpResetPasswordButton(
    BuildContext context, String title, Function onTap) {
  //wrap the Button into Container to give it some styling
  return Container(
    //BuildContext context - is used to get the size width
    width: MediaQuery.of(context).size.width,
    height: 60,
    //left, top, right, bottom
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 30),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      //button style
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            ////background colour when press the button
            return kColourPurpleMain;
          }
          //background colour
          return kColourBlueMain;
        }),
        //shape of the button
      ),
      child: Text(
        //use isLogin to find out weather it is a sing in or sign up button
        title,
        //text styling for sign in/up
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          color: kColourYellowMain,
        ),
      ),
    ),
  );
}
