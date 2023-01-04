import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:app/api/util.dart';
import 'package:app/api/profile.dart';

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
                  style: const TextStyle(
                    color: BunkieColors.slate,
                  ),
                  textScaleFactor: BunkieText.medium)),
          SizedBox(
            width: screenWidth * 0.05,
          ),
          Text(value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: BunkieColors.bright,
              ),
              textScaleFactor: BunkieText.medium),
        ],
      ),
    );
  }

  Widget adDeleteButton(bool ownProfile, BuildContext context, String token,
      String userID, double screenWidth, String ad_id, String adType) {
    if (ownProfile) {
      return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              width: screenWidth * 0.1,
              height: screenWidth * 0.05,
              child: ElevatedButton(
                style: editButtonStyle2,
                onPressed: () => {
                  BunkieProfileAPI.deleteHouseAdAction(
                      context, token, userID, ad_id, adType),
                },
                child: Text("x"),
              )));
    } else {
      return const SizedBox();
    }
  }

  static Padding lightStyle(String key, String value, screenWidth) {
    return Padding(
        padding: EdgeInsets.only(top: 5, left: 5),
        child: Container(
            width: screenWidth * 0.2,
            child: Text(
              "$key: $value",
              textAlign: TextAlign.left,
              style: TextStyle(color: BunkieColors.light),
              textScaleFactor: BunkieText.small,
            )));
  }

  Widget houseAddInfoBox(
      String adType,
      bool ownProfile,
      BuildContext context,
      String token,
      String userID,
      double screenWidth,
      String header,
      String specifications,
      String price,
      String size,
      String school,
      String gender,
      String location,
      String ad_id) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(5.0),
      child: Column(children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.all(5),
                      // HEADER
                      child: Container(
                        width: screenWidth*0.35,
                        child: Text(header,
                          style: const TextStyle(
                            color: BunkieColors.light,
                          ),
                          textScaleFactor: BunkieText.large),
                      )),
                  adDeleteButton(ownProfile, context, token, userID,
                      screenWidth, ad_id, adType),
                ])),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.all(5),
              // SPECIFICATIONS
              child: Text(specifications,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: BunkieColors.light,
                  ),
                  textScaleFactor: BunkieText.medium)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                lightStyle("Price", price.toString(), screenWidth),
                lightStyle("Size", size, screenWidth),
                lightStyle("School", school, screenWidth)
              ],
            ),
            Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    lightStyle("Location", location, screenWidth),
                    lightStyle("Gender", gender, screenWidth),
                  ],
                ))
          ],
        ),
      ]),
    );
  }

  Widget houseAddCard(
      String adType,
      bool ownProfile,
      BuildContext context,
      String token,
      String userID,
      double screenWidth,
      String header,
      String specifications,
      String price,
      String size,
      String school,
      String gender,
      String location,
      String ad_id) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
            // ignore: prefer_const_constructors
            child: Container(
          width: screenWidth * 0.75,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: BunkieColors.slate,
          ),
          child: houseAddInfoBox(
              adType,
              ownProfile,
              context,
              token,
              userID,
              screenWidth,
              header,
              specifications,
              price,
              size,
              school,
              gender,
              location,
              ad_id),
        )));
  }
}
