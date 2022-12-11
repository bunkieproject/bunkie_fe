import 'dart:convert' as json;
import 'package:app/api/util.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BunkieAuthAPI {
  static Future<void>  loginAction(BuildContext context, GlobalKey<FormState> formKey, Map<String, String> formData) async {
    if (formKey.currentState!.validate()) {
      try {
        print(json.jsonEncode(formData));
        var response = await http.post(
          Uri.parse(BunkieAddress.address),
          headers: <String, String> {'Content-Type': 'application/json; charset=UTF-8',},
          body: json.jsonEncode(formData),
        );
        if (response.statusCode == 200) {
          BunkieUtil.navigateToMainPage(context);
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  static Future<void> registerAction(BuildContext context, GlobalKey<FormState> formKey, Map<String, String> formData) async {
  if (formKey.currentState!.validate()) {
      try {
        print(json.jsonEncode(formData));
        var response = await http.post(
          Uri.parse(BunkieAddress.address),
          headers: <String, String> {'Content-Type': 'application/json; charset=UTF-8',},
          body: json.jsonEncode(formData),
        );
        if (response.statusCode == 200) {
          BunkieUtil.navigateToLoginPage(context);
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}