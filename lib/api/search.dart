import 'dart:convert' as json;
import 'package:app/api/util.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BunkieSearchAPI {
  static Future<Column> getHouseAds(BuildContext context,
      GlobalKey<FormState> formKey, Map<String, String> formData) async {
    if (formKey.currentState!.validate()) {
      try {
        var response = await http.post(
          Uri.parse(BunkieAddress.getRoute("ads/get_room_ad")),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.jsonEncode(formData),
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> responseMap = json.jsonDecode(response.body);
          // TODO : crate column
          return Column();
        }

        // TODO : crate column
        return Column();
      }
      
      catch (e) {
        print(e.toString());
      }
    }

    return Column();
  }

  static Future<Column> getBunkieAds(BuildContext context,
      GlobalKey<FormState> formKey, Map<String, String> formData) async {
    if (formKey.currentState!.validate()) {
      try {
        var response = await http.post(
          Uri.parse(BunkieAddress.getRoute("ads/get_bunkie")),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.jsonEncode(formData),
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> responseMap = json.jsonDecode(response.body);
          // TODO : crate column
          return Column();
        }

        // TODO : crate column
        return Column();
      }
      
      catch (e) {
        print(e.toString());
      }
    }

    return Column();
  }
}