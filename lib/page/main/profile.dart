import 'package:app/constants.dart';
import 'package:app/widget/profile_text.dart';
import 'package:app/widget/sidebar.dart';
import 'package:flutter/material.dart';

const List<Widget> ads = <Widget>[
  Text('House Ads',
      style: TextStyle(
        color: Colors.white,
      )),
  Text('Bunkie Ads',
      style: TextStyle(
        color: Colors.white,
      )),
];

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<bool> _isSelected = <bool>[true, false];

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/Untitled.png',
                fit: BoxFit.fill,
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(
              height: screenWidth * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: BunkieColors.greenygreen,
                      padding: const EdgeInsets.all(5.0),
                      child: const Text("Searching",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: BunkieColors.slate,
                          ),
                          textScaleFactor: BunkieText.medium),
                    )),
                SizedBox(
                  width: screenWidth * 0.02,
                ),
                const Text("@hendrix",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: BunkieColors.slate, fontSize: 20),
                    textScaleFactor: BunkieText.medium),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text("About me. Freakin' stuff",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: BunkieColors.slate, fontSize: 12),
                  textScaleFactor: BunkieText.medium),
            ),
            const Divider(
              color: BunkieColors.bright,
              indent: 35,
              endIndent: 35,
              thickness: 1,
            ),
            Column(children: [
              BunkieProfilePageWidgets.getProfilePageText(
                  "E-mail:", "samplemample@gmail.com", screenWidth, 70),
              BunkieProfilePageWidgets.getProfilePageText(
                  "Phone:", "Not Specified", screenWidth, 70),
              BunkieProfilePageWidgets.getProfilePageText(
                  "Name:", "Babür", screenWidth, 72),
              BunkieProfilePageWidgets.getProfilePageText(
                  "Gender:", "Male", screenWidth, 62),
            ]),
            const Divider(
              color: BunkieColors.bright,
              indent: 35,
              endIndent: 35,
              thickness: 1,
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Container(
                width: screenWidth * 0.75,
                color: BunkieColors.bright,
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        getProfileAdToggleButton(
                          _houseAction,
                          screenWidth * 0.5,
                          screenHeight * 0.03,
                          BunkieColors.dark,
                          "House Ads",
                          "Bunkie Ads",
                          BunkieColors.light,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text("haha"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _bunkieAction() {
    print("Show bunkie ads!");
  }

  void _houseAction() {
    print("Show house ads!");
  }

  Widget getProfileAdToggleButton(
    void Function()? onPressed,
    double width,
    double height,
    Color backgroundColor,
    String text1,
    String text2,
    Color textColor,
  ) {
    return Container(
      height: height,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: BunkieColors.transparentSlate,
      ),
      child: ToggleButtons(
        // ignore: sort_child_properties_last
        children: ads,
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < _isSelected.length; i++) {
              _isSelected[i] = i == index;
            }
          });
        },
        isSelected: _isSelected,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: BunkieColors.slate,
        selectedColor: BunkieColors.slate,
        fillColor: BunkieColors.slate,
        constraints: const BoxConstraints(
          minHeight: 40.0,
          minWidth: 80.0,
        ),
      ),
    );
  }

  Widget getHouseAd(
    void Function()? onPressed,
    double width,
    double height,
    Color backgroundColor,
    String text1,
    String text2,
    Color textColor,
  ) {
    return Container(
        height: height,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: BunkieColors.transparentSlate,
        ),
        child: Container(
          child: Column(
            children: [Text("haha")],
          ),
        ));
  }
}

// [
//           ElevatedButton(
//               onPressed: onPressed,
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(backgroundColor),
//                 shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25.0))),
//               ),
//               child: Text(text1,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: textColor),
//                   textScaleFactor: BunkieText.medium)),
//           ElevatedButton(
//               onPressed: onPressed,
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(backgroundColor),
//                 shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25.0))),
//               ),
//               child: Text(text2,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: textColor),
//                   textScaleFactor: BunkieText.medium))
//         ],