import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class BunkieSearchPageWidgets {
  static Text getHeader(String text) {
    return Text(text,
        textScaleFactor: BunkieText.large,
        style: const TextStyle(color: BunkieColors.dark));
  }

  static SizedBox getPreferencesButton(
      double width, String text, Function()? popUpFunction) {
    return SizedBox(
        width: width,
        child: ElevatedButton(
            onPressed: popUpFunction,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(BunkieColors.bright),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.5))),
            ),
            child: Text(text,
                textAlign: TextAlign.left,
                style: const TextStyle(color: BunkieColors.light),
                textScaleFactor: BunkieText.medium)));
  }
}
