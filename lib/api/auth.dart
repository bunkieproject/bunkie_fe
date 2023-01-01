import 'dart:convert' as json;
import 'package:app/api/util.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BunkieAuthAPI {
  static Future<void> loginAction(BuildContext context,
      GlobalKey<FormState> formKey, Map<String, String> formData) async {
    if (formKey.currentState!.validate()) {
      try {
        var response = await http.post(
          Uri.parse(BunkieAddress.getRoute("users/login")),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.jsonEncode(formData),
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> responseMap = json.jsonDecode(response.body);
          BunkieUtil.navigateToMainPage(
              context, responseMap["token"], responseMap["user_id"]);
        } else {
          BunkieUtil.navigateToLoginPage(context, true);
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  static Future<void> registerAction(BuildContext context,
      GlobalKey<FormState> formKey, Map<String, String> formData) async {
    if (formKey.currentState!.validate()) {
      try {
        var response = await http.post(
          Uri.parse(BunkieAddress.getRoute("users/signup")),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.jsonEncode(formData),
        );

        if (response.statusCode == 200) {
          BunkieUtil.navigateToLoginPage(context, false);
        } else {
          BunkieUtil.navigateToRegisterPage(context, true);
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
