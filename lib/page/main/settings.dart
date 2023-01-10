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
        appBar: AppBar(
          backgroundColor: BunkieColors.bright,
        ),
        drawer: BunkieSideBarNavigation(
          token: widget.token,
          userID: widget.userID,
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              width: screenWidth * 0.95,
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(top: formFieldPadding * 1.5),
                      child: Form(
                        key: _createAdFormKey,
                        child: Column(children: [
                          Padding(
                              padding: EdgeInsets.all(formFieldPadding),
                              child: const Text(
                                "Settings",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: BunkieColors.dark,
                                    fontWeight: FontWeight.bold),
                                textScaleFactor: BunkieText.large,
                              )),
                          Card(
                            color: BunkieColors.bright,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  formFieldContainer(formFieldPadding, "email",
                                      screenWidth, _emailValidator),
                                  formFieldContainer(
                                      formFieldPadding,
                                      "password",
                                      screenWidth,
                                      _passwordValidator),
                                  formFieldContainer(
                                      formFieldPadding,
                                      "password confirmation",
                                      screenWidth,
                                      _passwordConfirmationFormValidator),
                                  formFieldContainer(
                                      formFieldPadding,
                                      "username",
                                      screenWidth,
                                      _usernameValidator),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 20),
                                    child: BunkieFormWidgets.getSubmitButton(
                                      () {
                                        if (_createAdFormKey.currentState!
                                            .validate()) {
                                          BunkieProfileAPI.editAccountAction(
                                              context,
                                              widget.token,
                                              widget.userID,
                                              _adFormData);
                                        }
                                      },
                                      screenWidth * 0.3,
                                      screenHeight * 0.055,
                                      BunkieColors.dark,
                                      "Submit",
                                      BunkieColors.light,
                                    ),
                                  )
                                ]),
                          )
                        ]),
                      ))))
        ]));
  }

  static Container formFieldContainer(
      double formFieldPadding, fieldName, width, validator) {
    return Container(
      width: width,
      padding: EdgeInsets.all(formFieldPadding),
      child: BunkieFormWidgets.getTextFormFieldIconless(
          false, fieldName, validator),
    );
  }

  String? _passwordValidator(String? value) {
    if (value!.isEmpty) {
      return null;
    } else if (value.length < 6) {
      return "Can not be smaller than 6 characters";
    } else {
      _adFormData['password'] = value;
      return null;
    }
  }

  String? _usernameValidator(String? value) {
    if (value!.isEmpty) {
      return null;
    } else if (value.length < 4) {
      return "Can not be smaller than 4 characters";
    } else {
      _adFormData['username'] = value;
      return null;
    }
  }

  String? _passwordConfirmationFormValidator(String? value) {
    if (value!.isEmpty) {
      return null;
    } else if (_adFormData['password'] != value) {
      return "Passwords can not be different";
    } else {
      return null;
    }
  }

  String? _emailValidator(String? value) {
    if (value!.isEmpty) {
      return null;
    } else if (!value.contains('@')) {
      return "Your email is in incorrect shape!";
    } else {
      _adFormData['email'] = value;
      return null;
    }
  }
}
