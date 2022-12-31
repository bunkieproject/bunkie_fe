import 'package:app/page/authentication/forgotten_password.dart';
import 'package:app/page/authentication/login.dart';
import 'package:app/page/authentication/register.dart';
import 'package:app/page/main/house_search.dart';
import 'package:app/page/main/main.dart';
import 'package:app/page/main/profile.dart';
import 'package:app/page/add/create_ad.dart';
import 'package:app/page/main/roommate_search.dart';
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

  static void navigateToCreateAdPage(
      BuildContext context, String token, String userID) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CreateAdPage(
              token: token,
              userID: userID,
            )));
  }

  static void navigateToHouseSearchPage(
      BuildContext context, String token, String userID, Map<String, dynamic> searchForm) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HouseSearchPage(
              token: token,
              userID: userID,
              searchForm: searchForm,
            )));
  }

  static void navigateToBunkieSearchPage(
      BuildContext context, String token, String userID, Map<String, dynamic> searchForm) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RoommateSearchPage(
              token: token,
              userID: userID,
              searchForm: searchForm,
            )));
  }
}
