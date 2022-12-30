import 'package:app/constants.dart';
import 'package:app/widget/profile_text.dart';
import 'package:app/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:app/api/profile.dart';
import 'package:app/widget/form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CreateAdPage extends StatefulWidget {
  final String token;
  final String userID;
  const CreateAdPage({Key? key, required this.token, required this.userID})
      : super(key: key);

  @override
  _CreateAdPageState createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  Map<String, dynamic> _adFormData = Map<String, dynamic>();
  File? image;
  List<XFile>? imageFileList = [];
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
                          Padding(
                            padding: EdgeInsets.all(formFieldPadding),
                            child: uploadPhotoContainer(formFieldPadding,
                                "Upload Photo", screenWidth, screenHeight),
                          ),
                          this.imageFileList!.isNotEmpty
                              ? const Text("I have picked an image!")
                              : const Text("No image chosen."),
                          formFieldContainer(formFieldPadding, "Header",
                              screenWidth, _headerValidator),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              formFieldContainer(formFieldPadding, "City",
                                  screenWidth * 0.45, _cityValidator),
                              formFieldContainer(formFieldPadding, "District",
                                  screenWidth * 0.45, _districtValidator),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              formFieldContainer(formFieldPadding, "Quarter",
                                  screenWidth * 0.45, _quarterValidator),
                              formFieldContainer(formFieldPadding, "Size",
                                  screenWidth * 0.45, _sizeValidator),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              formFieldContainer(formFieldPadding, "School",
                                  screenWidth * 0.45, _schoolValidator),
                              formFieldContainer(formFieldPadding, "Gender",
                                  screenWidth * 0.45, _genderValidator),
                            ],
                          ),
                          formFieldContainer(formFieldPadding, "Price",
                              screenWidth, _priceValidator),
                          descriptionFieldContainer(formFieldPadding,
                              "Description", screenWidth, _priceValidator),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 20),
                            child: BunkieFormWidgets.getSubmitButton(
                              () {},
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
              )))
        ]));
  }

  String? _headerValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a header";
    } else if (value.length > 100) {
      return "Header needs to be under 100 characters!";
    } else {
      _adFormData['Header'] = value;
      return null;
    }
  }

  String? _cityValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a city";
    } else {
      _adFormData['City'] = value;
      return null;
    }
  }

  String? _districtValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a district";
    } else {
      _adFormData['District'] = value;
      return null;
    }
  }

  String? _quarterValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a district";
    } else {
      _adFormData['Quarter'] = value;
      return null;
    }
  }

  String? _sizeValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a district";
    } else {
      _adFormData['NumberOfRooms'] = value;
      return null;
    }
  }

  String? _priceValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a price";
    } else {
      _adFormData['Price'] = value;
      return null;
    }
  }

  String? _schoolValidator(String? value) {
    if (value!.isEmpty) {
      return "Please give a school";
    } else {
      _adFormData['School'] = value;
      return null;
    }
  }

  String? _genderValidator(String? value) {
    if (value!.isEmpty) {
      return "Please specifiy a gender prefernece";
    } else if (value != "female" ||
        value != "Female" ||
        value != "male" ||
        value != "Male" ||
        value != "None" ||
        value != "none") {
      return "Please specify a gender prefernece: Female, Male or None";
    } else {
      _adFormData['GenderPreferred'] = value;
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

  Widget uploadPhotoContainer(
      double formFieldPadding, heading, screenWidth, screenHeight) {
    return Container(
        width: screenWidth,
        padding: EdgeInsets.all(formFieldPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 5, left: 5),
                child: Text(
                  heading,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: BunkieColors.light),
                  textScaleFactor: BunkieText.large,
                )),
            BunkieFormWidgets.getSubmitButton(
              () async {
                try {
                  // final image = await ImagePicker()
                  //     .pickImage(source: ImageSource.gallery);
                  // if (image == null) return;
                  // File tempImg = File(image.path);
                  // setState(() => this.image = tempImg);
                  final List<XFile> selectedImages =
                      await ImagePicker().pickMultiImage();
                  if (selectedImages.isNotEmpty) {
                    imageFileList!.addAll(selectedImages);
                  }
                  print(
                      "Image List Length:" + imageFileList!.length.toString());
                  setState(() {});
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
