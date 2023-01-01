import 'package:app/page/ad/bunkie_ad.dart';
import 'package:app/page/ad/create_bunkie_ad.dart';
import 'package:app/page/ad/create_house_ad.dart';
import 'package:app/page/ad/house_ad.dart';
import 'package:app/page/authentication/forgotten_password.dart';
import 'package:app/page/authentication/login.dart';
import 'package:app/page/authentication/register.dart';
import 'package:app/page/main/house_search.dart';
import 'package:app/page/main/main.dart';
import 'package:app/page/main/profile.dart';
import 'package:app/page/main/roommate_search.dart';
import 'package:app/page/main/profile_edit.dart';
import 'package:app/page/ad/create_house_ad.dart';
import 'package:app/page/ad/create_bunkie_ad.dart';
import 'package:flutter/material.dart';

class BunkieUtil {
  static void navigateToLoginPage(BuildContext context, bool isError) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage(isError: isError)));
  }

  static void navigateToForgottenPasswordPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ForgottenPasswordPage()));
  }

  static void navigateToRegisterPage(BuildContext context, bool isError) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterPage(isError: isError,)));
  }

  static void navigateToMainPage(
      BuildContext context, String token, String userID) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MainPage(
              token: token,
              userID: userID,
            )));
  }

  static void navigateToProfilePage(BuildContext context, String token,
      String userID, Map<String, dynamic> displayProfileForm, bool ownProfile) {
    if (ownProfile) {
      displayProfileForm["user_id"] = userID;
    }
    displayProfileForm["token"] = token;
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProfilePage(
              token: token,
              userID: userID,
              displayProfileForm: displayProfileForm,
              ownProfile: ownProfile,
            )));
  }

  static void navigateToCreateHouseAdPage(
      BuildContext context, String token, String userID) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CreateHouseAdPage(
              token: token,
              userID: userID,
            )));
  }

  static void navigateToCreateBunkieAdPage(
      BuildContext context, String token, String userID) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CreateBunkieAdPage(
              token: token,
              userID: userID,
            )));
  }

  static void navigateToHouseSearchPage(BuildContext context, String token,
      String userID, Map<String, dynamic> searchForm) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HouseSearchPage(
              token: token,
              userID: userID,
              searchForm: searchForm,
            )));
  }

  static void navigateToBunkieSearchPage(BuildContext context, String token,
      String userID, Map<String, dynamic> searchForm) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RoommateSearchPage(
              token: token,
              userID: userID,
              searchForm: searchForm,
            )));
  }

  static void navigateToDetailedHouseAdPage(BuildContext context, String token,
      String userID, Map<String, dynamic> getAdDetailForm) {
    getAdDetailForm["token"] = token;
    getAdDetailForm["user_id"] = userID;
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailedHouseAdPage(
              token: token,
              userID: userID,
              getAdDetailForm: getAdDetailForm,
            )));
  }

  static void navigateToDetailedBunkieAdPage(BuildContext context, String token,
      String userID, Map<String, dynamic> getAdDetailForm) {
    getAdDetailForm["token"] = token;
    getAdDetailForm["user_id"] = userID;
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailedBunkieAdPage(
              token: token,
              userID: userID,
              getAdDetailForm: getAdDetailForm,
            )));
  }

  static void navigateToProfileEditPage(
      BuildContext context, String token, String userID) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EditProfilePage(token: token, userID: userID)));
  }
}
