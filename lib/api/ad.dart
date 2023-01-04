import 'dart:convert' as json;
import 'package:app/constants.dart';
import 'package:http/http.dart' as http;

class BunkieAdAPI {
  static Future<dynamic> getDetailedHouseAd(Map<String, dynamic> formData,) async {
    try {
      http.Response response = await http.post(
        Uri.parse(BunkieAddress.getRoute("ads/get_room_ad")),
        headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        body: json.jsonEncode(formData),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseMap = json.jsonDecode(response.body);
        return responseMap;
      }
    } catch (e) {
      print(e.toString());
    }
    return <String, dynamic>{};
  }

  static Future<dynamic> getDetailedBunkieAd(Map<String, dynamic> formData,) async {
    try {
      http.Response response = await http.post(
        Uri.parse(BunkieAddress.getRoute("ads/get_bunkie")),
        headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        body: json.jsonEncode(formData),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseMap = json.jsonDecode(response.body);
        return responseMap;
      }
    } catch (e) {
      print(e.toString());
    }
    return <String, dynamic>{};
  }
}
