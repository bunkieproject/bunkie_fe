import 'package:app/api/util.dart';
import "package:app/constants.dart";
import "package:app/page/authentication/login.dart";
import "package:flutter/material.dart";

class BunkieSideBarNavigation extends StatelessWidget {
  final String token;
  final String userID;
  const BunkieSideBarNavigation(
      {Key? key, required this.token, required this.userID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Drawer(
      width: screenWidth * 0.6,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(25.0))),
      child: Material(
        color: BunkieColors.slate,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.horizontal(right: Radius.circular(25.0))),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildMenuItem(
                    text: "Main Page",
                    icon: Icons.home,
                    onClicked: () => _navigateTo(context, 0, token, userID),
                  ),
                  const Divider(color: BunkieColors.light),
                  SizedBox(height: screenHeight * 0.025),
                  _buildMenuItem(
                    text: "Profile",
                    icon: Icons.person,
                    onClicked: () => _navigateTo(context, 1, token, userID),
                  ),
                  const Divider(color: BunkieColors.light),
                  SizedBox(height: screenHeight * 0.025),
                  _buildMenuItem(
                    text: "Settings",
                    icon: Icons.settings,
                    onClicked: () => _navigateTo(context, 2, token, userID),
                  ),
                  const Divider(color: BunkieColors.light),
                  SizedBox(height: screenHeight * 0.025),
                  _buildMenuItem(
                    text: "Logout",
                    icon: Icons.logout,
                    onClicked: () => _navigateTo(context, 4, token, userID),
                  ),
                  const Divider(color: BunkieColors.light)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = BunkieColors.light;

    return Row(
      children: [
        Icon(icon, color: color),
        TextButton(
            onPressed: onClicked,
            child: Text(
              text,
              style: TextStyle(color: color),
            ))
      ],
    );
  }

  void _navigateTo(
      BuildContext context, int index, String token, String userID) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        BunkieUtil.navigateToMainPage(context, token, userID);
        break;
      case 1:
        BunkieUtil.navigateToProfilePage(
            context, token, userID, <String, dynamic>{}, true);
        break;
      case 2:
        BunkieUtil.navigateToSettingsPage(context, token, userID);
        break;
      case 4:
        Navigator.of(context).pushAndRemoveUntil(
          // the new route
          MaterialPageRoute(
            builder: (BuildContext context) => LoginPage(
              isError: false,
            ),
          ),

          // this function should return true when we're done removing routes
          // but because we want to remove all other screens, we make it
          // always return false
          (Route route) => false,
        );
      //logout(context);
    }
  }
}
