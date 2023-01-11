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
import 'profile.dart' as profile;

bool? checkedValue = false;

bool? searching = profile.getSearchingStatus();

class EditProfilePage extends StatefulWidget {
  final String token;
  final String userID;
  const EditProfilePage({Key? key, required this.token, required this.userID})
      : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Map<String, dynamic> _profileData = <String, dynamic>{};
  final _createAdFormKey = GlobalKey<FormState>();
  File? image;
  List<Uint8List>? imageFileList = [];
  List<String> imageNameList = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    _profileData["profile_info"] = <String, dynamic>{};
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
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(top: formFieldPadding * 1.5),
                      child: Form(
                        key: _createAdFormKey,
                        child: Column(children: [
                          Padding(
                              padding: EdgeInsets.all(formFieldPadding),
                              child: const Text(
                                "Edit Your Profile",
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
                                  Padding(
                                    padding: EdgeInsets.all(formFieldPadding),
                                    child: uploadPhotoContainer(
                                        formFieldPadding,
                                        "Upload Photo",
                                        screenWidth,
                                        screenHeight),
                                  ),
                                  descriptionFieldContainer(
                                      formFieldPadding,
                                      "Description",
                                      screenWidth,
                                      _descriptionValidator),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      formFieldContainer(
                                          formFieldPadding,
                                          "Name",
                                          screenWidth * 0.45,
                                          _nameValidator),
                                      formFieldContainer(
                                          formFieldPadding,
                                          "Gender",
                                          screenWidth * 0.45,
                                          _genderValidator),
                                    ],
                                  ),
                                  formFieldContainer(formFieldPadding, "Phone",
                                      screenWidth * 0.95, _phoneValidator),
                                  //display phone
                                  Container(
                                    margin: EdgeInsets.all(formFieldPadding),
                                    width: screenWidth * 0.85,
                                    decoration: const BoxDecoration(
                                        color: BunkieColors.light,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: CheckboxListTile(
                                      title: const Text(
                                          "Display phone on the profile?",
                                          style: TextStyle(
                                              color: BunkieColors.slate)),
                                      value: checkedValue,
                                      checkColor: BunkieColors
                                          .dark, // color of tick Mark
                                      activeColor: BunkieColors.bright,
                                      onChanged: (newValue) {
                                        setState(() {
                                          checkedValue = newValue;
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, //  <-- leading Checkbox
                                    ),
                                  ),
                                  // search status
                                  Container(
                                    margin: EdgeInsets.all(formFieldPadding),
                                    width: screenWidth * 0.85,
                                    decoration: const BoxDecoration(
                                        color: BunkieColors.light,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: CheckboxListTile(
                                      title: const Text(
                                          "Are you searching a home?",
                                          style: TextStyle(
                                              color: BunkieColors.slate)),
                                      value: searching,
                                      checkColor: BunkieColors
                                          .dark, // color of tick Mark
                                      activeColor: BunkieColors.bright,
                                      onChanged: (newValue) {
                                        setState(() {
                                          searching = newValue;
                                          profile.setSearchingStatus(searching);
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, //  <-- leading Checkbox
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 20),
                                    child: BunkieFormWidgets.getSubmitButton(
                                      () {
                                        if (_createAdFormKey.currentState!
                                            .validate()) {    
                                          BunkieProfileAPI.editProfileAction(
                                              context,
                                              widget.token,
                                              widget.userID,
                                              _profileData);
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

  String? _nameValidator(String? value) {
    if (value!.isEmpty) {
      return null;
    } else {
      _profileData['profile_info']['name'] = value;
      return null;
    }
  }

  String? _descriptionValidator(String? value) {
    if (value!.isEmpty) {
      return null;
    } else {
      _profileData['profile_info']['description'] = value;
      return null;
    }
  }

  String? _phoneValidator(String? value) {
    if (checkedValue == false) {
      _profileData['profile_info']['display_phone'] = false;
    } else {
      _profileData['profile_info']['display_phone'] = true;
    }

    if (value!.isEmpty) {
      return null;
    } else if (value.contains(RegExp(r'[a-z]'))) {
      return "Enter a valid phone number.";
    } else {
      _profileData['profile_info']['phone'] = value;
      return null;
    }
  }

  String? _genderValidator(String? value) {
    if (value!.isEmpty) {
      return null;
    } else if (value.toLowerCase() != "female" &&
        value.toLowerCase() != "male" &&
        value != "") {
      return "Female, Male or None";
    } else {
      _profileData['profile_info']['gender'] = value;
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

  Widget checkyCheckBox(
      double padding, double screenWidth, bool? varToCheck, String setting) {
    return Container(
        margin: EdgeInsets.all(padding),
        width: screenWidth * 0.85,
        decoration: const BoxDecoration(
            color: BunkieColors.light,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: CheckboxListTile(
          title:
              Text(setting, style: const TextStyle(color: BunkieColors.slate)),
          value: varToCheck,
          checkColor: BunkieColors.dark, // color of tick Mark
          activeColor: BunkieColors.bright,
          onChanged: (newValue) {
            setState(() {
              varToCheck = newValue;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ));
  }

  Widget uploadPhotoContainer(
      double formFieldPadding, heading, screenWidth, screenHeight) {
    return Container(
        width: screenWidth,
        padding: EdgeInsets.all(formFieldPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Text(
                  heading,
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: BunkieColors.light),
                  textScaleFactor: BunkieText.large,
                )),
            BunkieFormWidgets.getSubmitButton(
              () async {
                try {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image == null) {
                    return;
                  } else {
                    File tempImg = File(image.path);
                    Uint8List imageAsBytes = tempImg.readAsBytesSync();
                    final imageAsPackage = ImgPackage.decodeImage(imageAsBytes);
                    final resizedImage =
                        ImgPackage.copyResize(imageAsPackage!, width: 100);
                    Uint8List resizedImageAsBytes =
                        Uint8List.fromList(ImgPackage.encodePng(resizedImage));
                    String imageBase64 = base64.encode(resizedImageAsBytes);
                    imageFileList!.clear();
                    imageNameList.clear();

                    _profileData["profile_info"]["profile_picture"] =
                        imageBase64;

                    imageFileList?.add(resizedImageAsBytes);
                    imageNameList.add(image.path);
                  }
                } on PlatformException catch (e) {
                  print('Failed to pick an image: $e');
                }
              },
              screenWidth * 0.3,
              screenHeight * 0.055,
              BunkieColors.dark,
              "Browse Files",
              BunkieColors.light,
            ),
          ],
        ));
  }
}
