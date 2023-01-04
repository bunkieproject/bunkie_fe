import 'dart:convert' as json;
import 'package:app/constants.dart';
import 'package:http/http.dart' as http;

class BunkieSearchAPI {
  static Future<dynamic> searchHouse(Map<String, dynamic> formData) async {
    try {
      http.Response response;
      if (!formData.containsKey("lower_price")) {
        response = await http.post(
          Uri.parse(BunkieAddress.getRoute("ads/search_room_ad_default")),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.jsonEncode(formData),
        );
      } else {
        response = await http.post(
          Uri.parse(BunkieAddress.getRoute("ads/search_room_ad_preferred")),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.jsonEncode(formData),
        );
      }

      if (response.statusCode == 200) {
        if (response.body != "null") {
          Iterable responseMap = json.jsonDecode(response.body);
          return responseMap;
        }
      }
    } catch (e) {
      print(e.toString());
    }

    return Iterable.generate(0);
  }

  static Future<dynamic> searchBunkie(Map<String, dynamic> formData) async {
    try {
      http.Response response;
      if (!formData.containsKey("lower_price")) {
       response = await http.post(
          Uri.parse(BunkieAddress.getRoute("ads/search_bunkie_default")),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.jsonEncode(formData),
        );
      } else {
        response = await http.post(
          Uri.parse(BunkieAddress.getRoute("ads/search_bunkie_preferred")),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.jsonEncode(formData),
        );
      }

      if (response.statusCode == 200) {
        if (response.body != "null") {
          Iterable responseMap = json.jsonDecode(response.body);
          return responseMap;
        }
      }

    } catch (e) {
      print(e.toString());
    }

    return Iterable.generate(0);
  }
}
