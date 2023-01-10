import 'package:app/constants.dart';
import 'package:app/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:app/api/profile.dart';
import 'package:app/widget/form.dart';
import 'package:flutter/services.dart';
import 'profile.dart' as profile;

class SettingsPage extends StatefulWidget {
  final String token;
  final String userID;
  const SettingsPage({Key? key, required this.token, required this.userID})
      : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Map<String, dynamic> _adFormData = <String, dynamic>{};
  final _createAdFormKey = GlobalKey<FormState>();
  File? image;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double formFieldPadding = 15;
    return Scaffold(
      backgroundColor: BunkieColors.light,
      appBar: AppBar(backgroundColor: BunkieColors.bright),
      drawer: BunkieSideBarNavigation(
        token: widget.token,
        userID: widget.userID,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth * 0.95,
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.only(top: formFieldPadding * 1.5),
            )),
          )
        ],
      ),
    );
  }
}
