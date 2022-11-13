import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class BunkieFormWidgets {
  static Text getFormMessage(String message, Color textColor) {
    return Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(color: textColor),
      textScaleFactor: BunkieText.large,
    );
  }

  static TextFormField getTextFormField(bool isObscure, String? labelText,
      IconData icon, String? Function(String?)? validator) {
    return TextFormField(
        obscureText: isObscure,
        decoration: InputDecoration(
            filled: true,
            fillColor: BunkieColors.light,
            prefixIcon: Icon(icon),
            labelText: labelText,
            border: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.5)))),
        validator: validator);
  }

  static SizedBox getSubmitButton(void Function()? onPressed, double width,
      double height, Color backgroundColor, String text, Color textColor) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
            ),
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor),
                textScaleFactor: BunkieText.medium)));
  }
}
