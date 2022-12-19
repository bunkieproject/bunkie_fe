import 'package:app/constants.dart';
import 'package:app/widget/search.dart';
import 'package:app/widget/sidebar.dart';
import 'package:flutter/material.dart';

class HouseSearchPage extends StatelessWidget {
  final String token;
  const HouseSearchPage({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: BunkieColors.light,
        appBar: AppBar(
          backgroundColor: BunkieColors.bright,
        ),
        drawer: BunkieSideBarNavigation(token: token),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BunkieSearchPageWidgets.getHeader("House Search"),
              SizedBox(height: screenHeight * 0.00625),
              BunkieSearchPageWidgets.getPreferencesButton(
                  screenWidth, "Click to choose your preferences", () {}),
              SizedBox(height: screenHeight * 0.00625),
              getHouseAds()
            ],
          ),
        )));
  }

  Column getHouseAds() {
    // TODO: get house ads from back-end
    return Column();
  }
}
