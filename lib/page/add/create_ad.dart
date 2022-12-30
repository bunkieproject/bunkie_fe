import 'package:app/constants.dart';
import 'package:app/widget/profile_text.dart';
import 'package:app/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:app/api/profile.dart';
import 'package:app/widget/form.dart';

class CreateAdPage extends StatefulWidget {
  final String token;
  final String userID;
  const CreateAdPage({Key? key, required this.token, required this.userID})
      : super(key: key);

  @override
  _CreateAdPageState createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  Map<String, String> _adFormData = Map<String, String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BunkieColors.light,
      appBar: AppBar(
        backgroundColor: BunkieColors.bright,
      ),
      drawer: BunkieSideBarNavigation(
        token: widget.token,
        userID: widget.userID,
      ),
      body: Center(
        child: Column(children: [
          BunkieFormWidgets.getTextFormFieldIconless(
              false, "Header", _headerValidator),
          // Row(
          //   children: [
          //     BunkieFormWidgets.getTextFormFieldIconless(
          //         false, "City", _cityValidator),
          //     BunkieFormWidgets.getTextFormFieldIconless(
          //         false, "District", _districtValidator)
          //   ],
          // ),
        ]),
      ),
    );
  }

  String? _headerValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a header";
    } else if (value.length > 100) {
      return "Header needs to be under 100 characters!";
    } else {
      _adFormData['header'] = value;
      return null;
    }
  }

  String? _cityValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a city";
    } else {
      _adFormData['city'] = value;
      return null;
    }
  }

  String? _districtValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a district";
    } else {
      _adFormData['district'] = value;
      return null;
    }
  }
}
