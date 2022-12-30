import 'package:app/api/util.dart';
import 'package:app/constants.dart';
import 'package:app/widget/form.dart';
import 'package:flutter/material.dart';

class BunkieSearchPageWidgets {
  static Map<String, dynamic> _prefFormData = <String, dynamic>{};

  static Text getHeader(String text) {
    return Text(text,
        textScaleFactor: BunkieText.large,
        style: const TextStyle(color: BunkieColors.dark));
  }

  static SizedBox getPreferencesButton(
      double width, String text, Function()? popUpFunction) {
    return SizedBox(
        width: width,
        child: ElevatedButton(
            onPressed: popUpFunction,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(BunkieColors.bright),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.5))),
            ),
            child: Text(text,
                textAlign: TextAlign.left,
                style: const TextStyle(color: BunkieColors.light),
                textScaleFactor: BunkieText.medium)));
  }

  static dynamic getPreferencesPopUp(
    String houseOrBunkie,
    GlobalKey<FormState> formKey,
    BuildContext context,
    String token,
    String userID,
    double width,
    double height,
  ) {
    _prefFormData.clear();
    _prefFormData['token'] = token;
    _prefFormData['user_id'] = userID;
    _prefFormData['how_many_docs'] = 10;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: const EdgeInsets.all(15),
            contentPadding: const EdgeInsets.all(25),
            backgroundColor: BunkieColors.light,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.5))),
            title: const Text(
              "Preferences",
              textScaleFactor: BunkieText.large,
              textAlign: TextAlign.center,
            ),
            titleTextStyle: const TextStyle(color: BunkieColors.dark),
            content: SingleChildScrollView(
                child: SizedBox(
                    width: width,
                    child: Form(
                        key: formKey,
                        child: Wrap(
                          direction: Axis.vertical,
                          children: [
                            _getPriceRow(width, height * 0.075),
                            _getRow(width, height * 0.075, "Size", "House size", _sizeFormValidator),
                            _getRow(width, height * 0.075, "Gender", "Preferred gender to live with", _genderFormValidator),
                            _getRow(width, height * 0.075, "School", "Preferred school", _schoolFormValidator),
                            _getRow(width, height * 0.075, "City", "Preferred city", _cityFormValidator),
                            _getRow(width, height * 0.075, "District", "Preferred district", _districtFormValidator),
                            _getRow(width, height * 0.075, "Quarter", "Preferred quarter", _quarterFormValidator),
                            BunkieFormWidgets.getSubmitButton(
                                () {
                                  if (formKey.currentState!.validate()) {
                                    if (houseOrBunkie.toLowerCase() == "house") {
                                      BunkieUtil.navigateToHouseSearchPage(context, token, userID, _prefFormData);
                                    } else {
                                      BunkieUtil.navigateToBunkieSearchPage(context, token, userID, _prefFormData);
                                    }
                                  }
                                },
                                width * 0.25,
                                height * 0.05,
                                BunkieColors.bright,
                                "Search",
                                BunkieColors.light)
                          ],
                        )))),
            contentTextStyle: const TextStyle(color: BunkieColors.slate),
          );
        });
  }

  static Container _getLabel(double width, double height, String label) {
    return Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        child: SizedBox(
          child: Text(
            label,
            style: const TextStyle(color: BunkieColors.dark),
          ),
        ));
  }

  static SizedBox _getDefaultTextFormField(
      double width, double height, String placeholder, String? Function(String?) validator) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          label: Text(
            placeholder,
            textScaleFactor: BunkieText.small,
            style: const TextStyle(color: Colors.black54),
          ),
          floatingLabelBehavior: null,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.5))),
        ),
      ),
    );
  }

  static SizedBox _getPriceRow(double width, double height) {
    return SizedBox(
        width: width,
        height: height,
        child: Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _getLabel(width * 0.2, height * 0.5, "Price"),
            SizedBox(
              width: width * 0.025,
            ),
            _getDefaultTextFormField(width * 0.25, height * 0.5, "Lower Limit", _lowerPriceFormValidator),
            SizedBox(
              width: width * 0.0125,
            ),
            const Text("-"),
            SizedBox(
              width: width * 0.0125,
            ),
            _getDefaultTextFormField(width * 0.25, height * 0.5, "Upper Limit", _upperPriceFormValidator)
          ],
        ));
  }

  static SizedBox _getRow(
      double width, double height, String label, String placeholder, String? Function(String?) validator) {
    return SizedBox(
        width: width,
        height: height,
        child: Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _getLabel(width * 0.2, height * 0.5, label),
            SizedBox(
              width: width * 0.025,
            ),
            _getDefaultTextFormField(width * 0.35, height * 0.5, placeholder, validator)
          ],
        ));
  }

  static Center getHouseAdList(
      String token, String userID, double width, Iterable? adList) {
    List<Widget> houseAdWidgets = <Widget>[];
    for (var each in adList!) {
      String location = each["city"] + each["district"] + each["quarter"];
      houseAdWidgets.add(
        Container(
            width: width,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getAdvertisementHeader(each["header"]),
                const SizedBox(
                  height: 10,
                ),
                _getSpeficiations(each["price"].toString(), location,
                    each["number_of_rooms"], each["gender_preferred"], ""),
              ],
            )),
      );
      houseAdWidgets.add(const SizedBox(
        height: 10,
      ));
    }
    return Center(child: Column(children: houseAdWidgets));
  }

  static Center getBunkieAdList(
      String token, String userID, double width, Iterable? adList) {
    List<Widget> bunkieAdWidgets = <Widget>[];
    for (var each in adList!) {
      String location = each["city"] + each["district"] + each["quarter"];
      bunkieAdWidgets.add(
        Container(
            width: width,
            padding: const EdgeInsets.all(25),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getAdvertisementHeader(each["header"]),
                const SizedBox(
                  height: 10,
                ),
                _getSpeficiations(each["price"], location,
                    each["number_of_rooms"], each["gender_preferred"], ""),
                const SizedBox(
                  height: 10,
                ),
                _getDescription(each["description"]),
                const SizedBox(
                  height: 10,
                ),
                _getDetailButton(token, userID, each["ad_id"]),
              ],
            )),
      );
      bunkieAdWidgets.add(const SizedBox(
        height: 10,
      ));
    }
    return Center(child: Column(children: bunkieAdWidgets));
  }

  static Text _getAdvertisementHeader(String header) {
    return Text(
      header,
      textScaleFactor: BunkieText.large,
      style: const TextStyle(color: BunkieColors.bright),
    );
  }

  static Container _getSpeficiations(
      String price, String loc, String size, String gender, String school) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Specifications",
              textScaleFactor: BunkieText.medium,
              style: TextStyle(color: BunkieColors.slate)),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Price: $price", style: const TextStyle(color: BunkieColors.dark)),
              Text("Location: $loc",
                  style: const TextStyle(color: BunkieColors.dark)),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Size: $size", style: const TextStyle(color: BunkieColors.dark)),
              Text("Gender: $gender",
                  style: const TextStyle(color: BunkieColors.dark))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text("School: $school", style: const TextStyle(color: BunkieColors.dark))
        ],
      ),
    );
  }

  static Container _getDescription(String description) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Description",
            textScaleFactor: BunkieText.medium,
            style: TextStyle(color: BunkieColors.slate)),
        const SizedBox(
          height: 10,
        ),
        Text(description, style: const TextStyle(color: BunkieColors.dark)),
      ]),
    );
  }

  static Container _getDetailButton(String token, String userID, String adID) {
    return Container(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
            onPressed: () => {
                  // navigate to deatiled Ad Page
                },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(BunkieColors.bright),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
            ),
            child: const Text("Detail",
                textAlign: TextAlign.center,
                style: TextStyle(color: BunkieColors.dark),
                textScaleFactor: BunkieText.medium)));
    ;
  }

  static String? _lowerPriceFormValidator(String? value) {
    if (value!.isEmpty) {
      _prefFormData['upper_price'] = 9999999;
    } else {
      _prefFormData['upper_price'] = value;
    }
    return null;
  }

  static String? _upperPriceFormValidator(String? value) {
    if (value!.isEmpty) {
      _prefFormData['lower_price'] = 0;
    } else {
      _prefFormData['lower_price'] = value;
    }
    return null;
  }

  static String? _sizeFormValidator(String? value) {
    if (value!.isEmpty) {
      _prefFormData['number_of_rooms'] = null;
    } else {
      _prefFormData['number_of_rooms'] = value;
    }
    return null;
  }

  static String? _genderFormValidator(String? value) {
    if (value!.isEmpty) {
      _prefFormData['gender_preferred'] = null;
    } else {
      _prefFormData['gender_preferred'] = value;
    }
    return null;
  }

  static String? _schoolFormValidator(String? value) {
    if (value!.isEmpty) {
      _prefFormData['school'] = null;
    } else {
      _prefFormData['school'] = value;
    }
    return null;
  }

  static String? _cityFormValidator(String? value) {
    if (value!.isEmpty) {
      _prefFormData['city'] = null;
    } else {
      _prefFormData['city'] = value;
    }
    return null;
  }

  static String? _districtFormValidator(String? value) {
    if (value!.isEmpty) {
      _prefFormData['district'] = null;
    } else {
      _prefFormData['district'] = value;
    }
    return null;
  }

  static String? _quarterFormValidator(String? value) {
    if (value!.isEmpty) {
      _prefFormData['quarter'] = null;
    } else {
      _prefFormData['quarter'] = value;
    }
    return null;
  }
}
