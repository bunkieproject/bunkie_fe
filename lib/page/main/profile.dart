import 'package:app/constants.dart';
import 'package:app/widget/profile_text.dart';
import 'package:app/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:app/api/profile.dart';
import 'package:app/api/util.dart';

const List<Widget> ads = <Widget>[
  Text('House Ads',
      style: TextStyle(
        color: Colors.white,
      )),
  Text('Bunkie Ads',
      style: TextStyle(
        color: Colors.white,
      )),
];

class ProfilePage extends StatefulWidget {
  final String token;
  final String userID;
  const ProfilePage({Key? key, required this.token, required this.userID})
      : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<bool> _isSelected = <bool>[true, false];
  String adType = "room_ads";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                    future: BunkieProfileAPI.getProfileInfo(
                        context, widget.token, widget.userID, screenWidth),
                    builder: ((context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Text("Loading...");
                        default:
                          if (snapshot.hasError) {
                            return const Text(
                                "Error during getting profile info, please try again.");
                          } else if (snapshot.data!.isNotEmpty) {
                            String username = _validator(snapshot
                                .data?['user_account_info']['username']);
                            String fullName = _validator(
                                snapshot.data?['user_profile_info']['name']);
                            String description = _validator(snapshot
                                .data!['user_profile_info']['description']);
                            String gender = _validator(
                                snapshot.data?['user_profile_info']['gender']);
                            bool? displayPhone = _validatorBool(snapshot
                                .data?['user_profile_info']['display_phone']);
                            bool? displayEmail = _validatorBool(snapshot
                                .data?['user_profile_info']['display_email']);
                            String email = _validatorWithPreference(
                                snapshot.data?['user_account_info']['email'],
                                displayEmail);
                            String phone = _validatorWithPreference(
                                snapshot.data?['user_account_info']['phone'],
                                displayPhone);
                            return Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/babur.png',
                                    fit: BoxFit.fill,
                                    height: 150,
                                    width: 150,
                                  ),
                                ),
                                SizedBox(
                                  height: screenWidth * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Container(
                                          color: BunkieColors.greenygreen,
                                          padding: const EdgeInsets.all(5.0),
                                          child: const Text("Searching",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: BunkieColors.slate,
                                              ),
                                              textScaleFactor:
                                                  BunkieText.medium),
                                        )),
                                    SizedBox(
                                      width: screenWidth * 0.02,
                                    ),
                                    Text('@$username',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: BunkieColors.slate,
                                            fontSize: 20),
                                        textScaleFactor: BunkieText.medium),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(description,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: BunkieColors.slate,
                                          fontSize: 12),
                                      textScaleFactor: BunkieText.medium),
                                ),
                                const Divider(
                                  color: BunkieColors.bright,
                                  indent: 35,
                                  endIndent: 35,
                                  thickness: 1,
                                ),
                                Column(children: [
                                  BunkieProfilePageWidgets.getProfilePageText(
                                      "E-mail:", email, screenWidth, 70),
                                  BunkieProfilePageWidgets.getProfilePageText(
                                      "Phone:", phone, screenWidth, 70),
                                  BunkieProfilePageWidgets.getProfilePageText(
                                      "Name:", fullName, screenWidth, 72),
                                  BunkieProfilePageWidgets.getProfilePageText(
                                      "Gender:", gender, screenWidth, 62),
                                ]),
                                const Divider(
                                  color: BunkieColors.bright,
                                  indent: 35,
                                  endIndent: 35,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: Container(
                                    width: screenWidth * 0.75,
                                    color: BunkieColors.bright,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: ElevatedButton(
                                                style: raisedButtonStyle,
                                                onPressed: () => {
                                                  BunkieUtil
                                                      .navigateToCreateAdPage(
                                                          context,
                                                          widget.token,
                                                          widget.userID)
                                                },
                                                child: const Text('+'),
                                              ),
                                            ),
                                            getProfileAdToggleButton(
                                              _houseAction,
                                              screenWidth * 0.5,
                                              screenHeight * 0.03,
                                              BunkieColors.dark,
                                              "House Ads",
                                              "Bunkie Ads",
                                              BunkieColors.light,
                                            )
                                          ],
                                        ),
                                        _adValidator(snapshot.data?[adType],
                                            screenWidth),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Text("No info to display!");
                          }
                      }
                    })),
              ],
            ),
          ),
        ));
  }

  void _bunkieAction() {
    print("Show bunkie ads!");
  }

  void _houseAction() {
    print("Show house ads!");
  }

  Widget getProfileAdToggleButton(
    void Function()? onPressed,
    double width,
    double height,
    Color backgroundColor,
    String text1,
    String text2,
    Color textColor,
  ) {
    return Container(
      height: height,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: BunkieColors.transparentSlate,
      ),
      child: ToggleButtons(
        // ignore: sort_child_properties_last
        children: ads,
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < _isSelected.length; i++) {
              _isSelected[i] = i == index;
            }
            if (index == 0) {
              adType = "room_ads";
            } else {
              adType = "bunkie_ads";
            }
          });
        },
        isSelected: _isSelected,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: BunkieColors.slate,
        selectedColor: BunkieColors.slate,
        fillColor: BunkieColors.slate,
        constraints: const BoxConstraints(
          minHeight: 40.0,
          minWidth: 80.0,
        ),
      ),
    );
  }

  String _validator(dynamic value) {
    if (value == "null" || value == null) {
      return "Not specified.";
    } else {
      return value;
    }
  }

  String _validatorWithPreference(dynamic value, dynamic preference) {
    if (value == "null" || value == null) {
      return "Not specified.";
    } else if (preference == false) {
      return "Not specified.";
    } else {
      return value;
    }
  }

  static Center _adValidator(Iterable? value, double screenWidth) {
    List<Widget> houseAd = <Widget>[];
    if (value == "null" || value == null) {
      houseAd.add(const SizedBox(
        height: 10,
      ));
    } else {
      for (var each in value) {
        print("haha");
        print(each);
        houseAd.add(Column(
          children: [
            BunkieProfilePageWidgets.houseAddCard(
                screenWidth,
                each["header"],
                "Specifications",
                each["price"].toString(),
                each["number_of_rooms"],
                each["school"],
                each["gender_preferred"],
                each["quarter"] +
                    " / " +
                    each["district"] +
                    " / " +
                    each["city"])
          ],
        ));
      }
    }
    return Center(child: Column(children: houseAd));
  }

  bool? _validatorBool(bool? value) {
    if (value == "null" || value == null) {
      return false;
    } else {
      return value;
    }
  }
}
