import "package:app/constants.dart";
import 'package:app/page/main/profile.dart';
import "package:flutter/material.dart";
import 'package:app/page/main/main.dart';

class BunkieSideBarNavigation extends StatelessWidget {
  final String token;
  const BunkieSideBarNavigation({Key? key, required this.token})
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
                    onClicked: () => _navigateTo(context, 0, token),
                  ),
                  const Divider(color: BunkieColors.light),
                  SizedBox(height: screenHeight * 0.025),
                  _buildMenuItem(
                    text: "Profile",
                    icon: Icons.person,
                    onClicked: () => _navigateTo(context, 1, token),
                  ),
                  const Divider(color: BunkieColors.light),
                  SizedBox(height: screenHeight * 0.025),
                  _buildMenuItem(
                    text: "Messages",
                    icon: Icons.email,
                    onClicked: () => _navigateTo(context, 2, token),
                  ),
                  const Divider(color: BunkieColors.light),
                  SizedBox(height: screenHeight * 0.025),
                  _buildMenuItem(
                    text: "Settings",
                    icon: Icons.settings,
                    onClicked: () => _navigateTo(context, 3, token),
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

  void _navigateTo(BuildContext context, int index, String token) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MainPage(token: token),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfilePage(token: token),
        ));
      // TODO: navigate to other pages
    }
  }
}
