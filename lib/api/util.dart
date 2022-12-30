import 'package:app/page/authentication/forgotten_password.dart';
import 'package:app/page/authentication/login.dart';
import 'package:app/page/authentication/register.dart';
import 'package:app/page/main/main.dart';
import 'package:app/page/main/profile.dart';
import 'package:flutter/material.dart';

class BunkieUtil {
  static void navigateToLoginPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  static void navigateToForgottenPasswordPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ForgottenPasswordPage()));
  }

  static void navigateToRegisterPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  static void navigateToMainPage(
      BuildContext context, String token, String userID) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MainPage(
              token: token,
              userID: userID,
            )));
  }

  static void navigateToProfilePage(
      BuildContext context, String token, String userID) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProfilePage(
              token: token,
              userID: userID,
            )));
  }
}
