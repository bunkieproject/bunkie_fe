import 'dart:convert' as json;
import 'package:app/api/util.dart';
import 'package:app/constants.dart';
import 'package:app/widget/profile_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BunkieProfileAPI {
  static Future<Map<String, dynamic>> getHouseAdAction(
      BuildContext context, String token, String id, double screenWidth) async {
    BunkieProfilePageWidgets widgets = BunkieProfilePageWidgets();
    Map<String, dynamic> form = {'token': token, 'user_id': id};
    try {
      var response = await http.post(
        Uri.parse(BunkieAddress.getRoute("ads/get_room_ad")),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.jsonEncode(form),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseMap = json.jsonDecode(response.body);
        List<dynamic> house_ads = responseMap["room_ads"];
        print(house_ads);
        return responseMap;
      }
    } catch (e) {
      print(e.toString());
    }
    throw () {
      Map<String, dynamic>();
    };
  }
}
