import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class BunkieProfilePageWidgets {
  static Container getProfilePageText(
      String key, String value, double screenWidth, double leftPadding) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: leftPadding),
              child: Text(key,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: BunkieColors.slate,
                  ),
                  textScaleFactor: BunkieText.medium)),
          SizedBox(
            width: screenWidth * 0.05,
          ),
          Text(value,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: BunkieColors.bright,
              ),
              textScaleFactor: BunkieText.medium),
        ],
      ),
    );
  }
}
