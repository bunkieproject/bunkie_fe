import 'package:app/constants.dart';
import 'package:app/page/main/house_search.dart';
import 'package:app/page/main/roommate_search.dart';
import 'package:app/widget/sidebar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final String token;
  final String userID;
  const MainPage({Key? key, required this.token, required this.userID}) : super(key: key);

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
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.35,
              height: screenWidth * 0.35,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5)),
                color: BunkieColors.bright,
                child: TextButton(
                    onPressed: () => {_navigateToHouseSearchPage(context)},
                    child: const Text(
                      "Search House",
                      textAlign: TextAlign.center,
                      textScaleFactor: BunkieText.large,
                      style: TextStyle(color: BunkieColors.light),
                    )),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.025,
            ),
            SizedBox(
              width: screenWidth * 0.35,
              height: screenWidth * 0.35,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5)),
                color: BunkieColors.bright,
                child: TextButton(
                    onPressed: () => {_navigateToRoommateSearchPage(context)},
                    child: const Text(
                      "Search Bunkie",
                      textAlign: TextAlign.center,
                      textScaleFactor: BunkieText.large,
                      style: TextStyle(color: BunkieColors.light),
                    )),
              ),
            )
          ],
        )));
  }

  void _navigateToHouseSearchPage(BuildContext context) {
    Map<String, dynamic> searchForm = <String, dynamic>{};
    searchForm["token"] = token;
    searchForm["user_id"] = userID;
    searchForm["how_many_docs"] = 10;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HouseSearchPage(token: token, userID: userID, searchForm: searchForm,)));
  }

  void _navigateToRoommateSearchPage(BuildContext context) {
    Map<String, dynamic> searchForm = <String, dynamic>{};
    searchForm["token"] = token;
    searchForm["user_id"] = userID;
    searchForm["how_many_docs"] = 10;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RoommateSearchPage(token: token, userID: userID, searchForm: searchForm,)));
  }
}
