import 'package:app/api/ad.dart';
import 'package:app/constants.dart';
import 'package:app/widget/detailed_ad.dart';
import 'package:app/widget/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailedBunkieAdPage extends StatelessWidget {
  final String token;
  final String userID;
  final Map<String, dynamic> getAdDetailForm;

  const DetailedBunkieAdPage(
      {Key? key,
      required this.token,
      required this.userID,
      required this.getAdDetailForm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BunkieColors.light,
        appBar: AppBar(
          backgroundColor: BunkieColors.bright,
        ),
        drawer: BunkieSideBarNavigation(
          token: token,
          userID: userID,
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(25.0),
                child: FutureBuilder(
                  future: BunkieAdAPI.getDetailedBunkieAd(getAdDetailForm),
                  builder: (((context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Text("Loading....");
                      default:
                        if (snapshot.hasError) {
                          return const Text(
                              "Error during displaying the ad, please try again");
                        } else {
                          return BunkieDetailedAdWidgets.getBunkieAdDetail(
                              context, token, userID, snapshot.data);
                        }
                    }
                  })),
                ))));
  }
}
