import 'dart:convert' as json;
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BunkieSearchAPI {
  static Future<dynamic> getHouseAds(
      BuildContext context, Map<String, dynamic> formData) async {
    try {
      http.Response response;
      if (!formData.containsKey("lower_price")) {
        response = await http.get(
          Uri.https(
              BunkieAddress.host,
              "/ads/search_room_ad_default",
              formData.map(
                (key, value) => MapEntry(key, value.toString()),
              )),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
      } else {
        response = await http.get(
          Uri.https(
              BunkieAddress.host,
              "/ads/search_room_ad_preferred",
              formData.map(
                (key, value) => MapEntry(key, value.toString()),
              )),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
      }

      if (response.statusCode == 200) {
        Iterable responseMap = json.jsonDecode(response.body);
        return responseMap;
      }
    } catch (e) {
      print(e.toString());
    }

    return Iterable.generate(0);
  }

  static Future<dynamic> getBunkieAds(
      BuildContext context, Map<String, dynamic> formData) async {
    try {
      http.Response response;
      if (!formData.containsKey("lower_price")) {
       response = await http.get(
          Uri.https(
              BunkieAddress.host,
              "/ads/search_bunkie_default",
              formData.map(
                (key, value) => MapEntry(key, value.toString()),
              )),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
      } else {
        response = await http.get(
          Uri.https(
              BunkieAddress.host,
              "/ads/search_bunkie_preferred",
              formData.map(
                (key, value) => MapEntry(key, value.toString()),
              )),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
      }

      if (response.statusCode == 200) {
        Iterable responseMap = json.jsonDecode(response.body);
        return responseMap;
      }

    } catch (e) {
      print(e.toString());
    }

    return Iterable.generate(0);
  }
}
