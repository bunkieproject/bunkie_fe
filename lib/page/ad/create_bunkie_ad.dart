import 'package:app/constants.dart';
import 'package:app/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:app/api/profile.dart';
import 'package:app/widget/form.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as ImgPackage;

class CreateBunkieAdPage extends StatefulWidget {
  final String token;
  final String userID;
  const CreateBunkieAdPage({Key? key, required this.token, required this.userID})
      : super(key: key);

  @override
  _CreateBunkieAdPageState createState() => _CreateBunkieAdPageState();
}

class _CreateBunkieAdPageState extends State<CreateBunkieAdPage> {
  Map<String, dynamic> _adFormData = <String, dynamic>{};
  final _createAdFormKey = GlobalKey<FormState>();
  File? image;
  List<Uint8List>? imageFileList = [];
  List<String> imageNameList = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double formFieldPadding = 15;
    return Scaffold(
        backgroundColor: BunkieColors.light,
        appBar: AppBar(
          backgroundColor: BunkieColors.bright,
        ),
        drawer: BunkieSideBarNavigation(
          token: widget.token,
          userID: widget.userID,
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              width: screenWidth * 0.95,
              height: screenHeight * 0.75,
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(top: formFieldPadding * 1.5),
                      child: Form(
                        key: _createAdFormKey,
                        child: Column(children: [
                          Padding(
                              padding: EdgeInsets.all(formFieldPadding),
                              child: const Text(
                                "Create Advertisement",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: BunkieColors.dark,
                                    fontWeight: FontWeight.bold),
                                textScaleFactor: BunkieText.large,
                              )),
                          Card(
                            color: BunkieColors.bright,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  formFieldContainer(formFieldPadding, "Header",
                                      screenWidth, _headerValidator),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      formFieldContainer(
                                          formFieldPadding,
                                          "City",
                                          screenWidth * 0.45,
                                          _cityValidator),
                                      formFieldContainer(
                                          formFieldPadding,
                                          "District",
                                          screenWidth * 0.45,
                                          _districtValidator),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      formFieldContainer(
                                          formFieldPadding,
                                          "Quarter",
                                          screenWidth * 0.45,
                                          _quarterValidator),
                                      formFieldContainer(
                                          formFieldPadding,
                                          "Size",
                                          screenWidth * 0.45,
                                          _sizeValidator),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      formFieldContainer(
                                          formFieldPadding,
                                          "School",
                                          screenWidth * 0.45,
                                          _schoolValidator),
                                      formFieldContainer(
                                          formFieldPadding,
                                          "Gender",
                                          screenWidth * 0.45,
                                          _genderValidator),
                                    ],
                                  ),
                                  formFieldContainer(formFieldPadding, "Price",
                                      screenWidth, _priceValidator),
                                  descriptionFieldContainer(
                                      formFieldPadding,
                                      "Description",
                                      screenWidth,
                                      _descriptionValidator),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 20),
                                    child: BunkieFormWidgets.getSubmitButton(
                                      () {
                                        if (_createAdFormKey.currentState!
                                            .validate()) {
                                          BunkieProfileAPI.createBunkieAdAction(
                                              context,
                                              widget.token,
                                              widget.userID,
                                              _adFormData);
                                        }
                                      },
                                      screenWidth * 0.3,
                                      screenHeight * 0.055,
                                      BunkieColors.dark,
                                      "Submit",
                                      BunkieColors.light,
                                    ),
                                  )
                                ]),
                          )
                        ]),
                      ))))
        ]));
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

  String? _quarterValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a district";
    } else {
      _adFormData['quarter'] = value;
      return null;
    }
  }

  String? _sizeValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a district";
    } else {
      _adFormData['number_of_rooms'] = value;
      return null;
    }
  }

  String? _priceValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a price";
    } else {
      _adFormData['price'] = double.parse(value);
      return null;
    }
  }

  String? _descriptionValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a price";
    } else {
      _adFormData['description'] = value;
      return null;
    }
  }

  String? _schoolValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a school";
    } else {
      _adFormData['school'] = value;
      return null;
    }
  }

  String? _photoValidator(List<XFile>? imageFileList) {
    if (imageFileList!.isEmpty) {
      return "Please select an image.";
    } else {
      return null;
    }
  }

  String? _genderValidator(String? value) {
    if (value!.isEmpty) {
      return "Please specifiy a gender preference";
    } else if (value.toLowerCase() != "female" &&
        value.toLowerCase() != "male" &&
        value != "") {
      return "Please specify a gender preference: Female, Male or None";
    }  else {
      _adFormData['gender_preferred'] = value;
      return null;
    }
  }

  static Container descriptionFieldContainer(
      double formFieldPadding, fieldName, width, validator) {
    return Container(
        width: width,
        padding: EdgeInsets.all(formFieldPadding),
        child: TextFormField(
            maxLines: null,
            obscureText: false,
            decoration: InputDecoration(
                filled: true,
                fillColor: BunkieColors.light,
                labelText: fieldName,
                border: const UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.5)))),
            validator: validator));
  }

  static Container formFieldContainer(
      double formFieldPadding, fieldName, width, validator) {
    return Container(
      width: width,
      padding: EdgeInsets.all(formFieldPadding),
      child: BunkieFormWidgets.getTextFormFieldIconless(
          false, fieldName, validator),
    );
  }
}
