import 'dart:convert' as json;
import 'package:app/api/util.dart';
import 'package:app/constants.dart';
import 'package:app/widget/profile_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BunkieProfileAPI {
  static Future<Map<String, dynamic>> getProfileInfo(
      BuildContext context, String token, String id, double screenWidth) async {
    BunkieProfilePageWidgets widgets = BunkieProfilePageWidgets();
    Map<String, dynamic> form = {'token': token, 'user_id': id};
    try {
      var response = await http.post(
        Uri.parse(BunkieAddress.getRoute("users/display_profile")),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.jsonEncode(form),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseMap = json.jsonDecode(response.body);
        return responseMap;
      }
    } catch (e) {
      print("Error!");
      print(e.toString());
    }
    return Map<String, dynamic>();
  }

  static Future<void> createAdAction(BuildContext context, String token,
      String id, Map<String, dynamic> formData) async {
    formData["token"] = token;
    formData["user_id"] = id;
    try {
      var response = await http.post(
        Uri.parse(BunkieAddress.getRoute("ads/create_room_ad")),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.jsonEncode(formData),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseMap = json.jsonDecode(response.body);
        // ignore: use_build_context_synchronously
        BunkieUtil.navigateToProfilePage(context, token, id);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> editProfileAction(BuildContext context, String token,
      String id, Map<String, dynamic> formData) async {
    formData["token"] = token;
    formData["user_id"] = id;
    try {
      var response = await http.put(
        Uri.parse(BunkieAddress.getRoute("users/edit_profile")),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.jsonEncode(formData),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseMap = json.jsonDecode(response.body);
        // ignore: use_build_context_synchronously
        BunkieUtil.navigateToProfilePage(context, token, id);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
