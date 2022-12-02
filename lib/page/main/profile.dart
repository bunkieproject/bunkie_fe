import 'package:app/constants.dart';
import 'package:app/widget/profile_text.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: BunkieColors.light,
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
                child: Column(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
