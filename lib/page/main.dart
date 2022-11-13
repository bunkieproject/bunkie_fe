import 'package:app/constants.dart';
import 'package:flutter/material.dart';

import '../widget/sidebar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
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
                    onPressed: () => {},
                    child: const Text(
                      "Search Home",
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
                    onPressed: () => {},
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

  /**
  void _navigateToHouseSearchPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HouseSearchPage()));
  }

  void _navigateToBunkieSearchPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BunkieSearchPage()));
  }
   */
}
