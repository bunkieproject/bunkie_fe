import 'package:app/constants.dart';
import 'package:app/widget/search.dart';
import 'package:app/widget/sidebar.dart';
import 'package:flutter/material.dart';

class RoommateSearchPage extends StatefulWidget {
  const RoommateSearchPage({super.key});

  @override
  _RoommateSearchPage createState() => _RoommateSearchPage();
}

class _RoommateSearchPage extends State<RoommateSearchPage> {
  final _preferencesFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: BunkieColors.light,
        appBar: AppBar(
          backgroundColor: BunkieColors.bright,
        ),
        drawer: BunkieSideBarNavigation(),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BunkieSearchPageWidgets.getHeader("Bunkie Search"),
              SizedBox(height: screenHeight * 0.00625),
              BunkieSearchPageWidgets.getPreferencesButton(
                  screenWidth, "Click to choose your preferences", () {
                BunkieSearchPageWidgets.getPreferencesPopUp(_preferencesFormKey,
                    context, screenWidth * 0.9, screenHeight * 0.85);
              }),
              SizedBox(height: screenHeight * 0.00625),
              getRoommateAds()
            ],
          ),
        )));
  }

  Column getRoommateAds() {
    return Column();
  }
}
