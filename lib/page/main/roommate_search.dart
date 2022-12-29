import 'package:app/constants.dart';
import 'package:app/widget/search.dart';
import 'package:app/widget/sidebar.dart';
import 'package:flutter/material.dart';

class RoommateSearchPage extends StatelessWidget {
  final String token;
  final String userID;

  final _preferencesFormKey = GlobalKey<FormState>();
  RoommateSearchPage({Key? key, required this.token, required this.userID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: BunkieColors.light,
        appBar: AppBar(
          backgroundColor: BunkieColors.bright,
        ),
        drawer: BunkieSideBarNavigation(token: token, userID: userID,),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BunkieSearchPageWidgets.getHeader("Bunkie Search"),
              SizedBox(height: screenHeight * 0.00625),
              BunkieSearchPageWidgets.getPreferencesButton(
                  screenWidth, "Click to choose your preferences", () {
                BunkieSearchPageWidgets.getPreferencesPopUp(_preferencesFormKey,
                    context, screenWidth * 0.9, screenHeight * 0.85);
              }),
              SizedBox(height: screenHeight * 0.00625),
              //getRoommateAds()
            ],
          ),
        )));
  }
}
