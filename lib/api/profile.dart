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
      var response = await http.get(
        Uri.https(BunkieAddress.host, "/ads/get_room_ad",
            form.map((key, value) => MapEntry(key, value.toString()))),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        //body: json.jsonEncode(form),
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
    return Map<String, dynamic>();
  }

  static Future<void> createAdAction(BuildContext context, String token,
      String id, Map<String, dynamic> formData) async {
    formData["token"] = token;
    formData["user_id"] = id;
    print("am i working?");
    print(formData);
    try {
      print("really, am i?");
      var response = await http.post(
        Uri.parse(BunkieAddress.getRoute("ads/create_room_ad")),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.jsonEncode(formData),
      );
      print("what's happenin'!");
      print(formData);
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseMap = json.jsonDecode(response.body);
        // ignore: use_build_context_synchronously
        BunkieUtil.navigateToProfilePage(context, token, id);
      }
    } catch (e) {
      print("catchy catch");
      print(e.toString());
    }
  }
}
