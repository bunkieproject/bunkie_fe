import 'package:app/api/util.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class BunkieDetailedAdWidgets {
  static Center getHouseAdDetails(BuildContext context, String token,
      String userID, Map<String, dynamic> adDetail) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          _getHeader(adDetail["header"]),
          const SizedBox(
            height: 25,
          ),
          _getHeaderPhoto(),
          const SizedBox(
            height: 25,
          ),
          _getVisitButton(context, token, userID, adDetail["user_id"], adDetail["ad_id"]),
          const SizedBox(
            height: 25,
          ),
          _getSpeficiations(
              adDetail["price"].toString(),
              "${adDetail["city"]}, ${adDetail["district"]}, ${adDetail["quarter"]}",
              adDetail["number_of_rooms"],
              adDetail["gender_preferred"],
              adDetail["school"]),
          const SizedBox(
            height: 25,
          ),
          _getDescription(adDetail["description"]),
        ]));
  }

  static Center getBunkieAdDetail(BuildContext context, String token,
      String userID, Map<String, dynamic> adDetail) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          _getHeader(adDetail["header"]),
          const SizedBox(
            height: 25,
          ),
          _getVisitButton(context, token, userID, adDetail["user_id"], adDetail["ad_id"]),
          const SizedBox(
            height: 25,
          ),
          _getSpeficiations(
              adDetail["price"].toString(),
              "${adDetail["city"]}, ${adDetail["district"]}, ${adDetail["quarter"]}",
              adDetail["number_of_rooms"],
              adDetail["gender_preferred"],
              adDetail["school"]),
          const SizedBox(
            height: 25,
          ),
          _getDescription(adDetail["description"]),
        ]));
  }

  static Text _getHeader(String header) {
    return Text(
      header,
      textScaleFactor: BunkieText.xlarge,
      style: const TextStyle(color: BunkieColors.dark),
    );
  }

  static Container _getHeaderPhoto() {
    return Container();
  }

  static Container _getVisitButton(
      BuildContext context, String token, String userID, String ownerID, String adID) {
    Map<String, dynamic> getDisplayProfileForm;
    getDisplayProfileForm = <String, dynamic>{"user_id": adID};
    return Container(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
            onPressed: () => {
                  /*if (adType.toLowerCase() == "house") {
                BunkieUtil.navigateToProfilePage(context, token, userID, getDisplayProfileForm)
              } else {
                BunkieUtil.navigateToProfilePage(context, token, userID, getDisplayProfileForm)
              }*/
                },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(BunkieColors.bright),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
            ),
            child: const Text("Visit Ad Owner",
                textAlign: TextAlign.center,
                style: TextStyle(color: BunkieColors.light),
                textScaleFactor: BunkieText.medium)));
  }

  static Container _getSpeficiations(
      String price, String loc, String size, String gender, String school) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Specifications",
              textScaleFactor: BunkieText.large,
              style: TextStyle(color: BunkieColors.slate)),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Price: $price",
                  style: const TextStyle(color: BunkieColors.dark)),
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
              Text("Size: $size",
                  style: const TextStyle(color: BunkieColors.dark)),
              Text("Gender: $gender",
                  style: const TextStyle(color: BunkieColors.dark))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text("School: $school",
              style: const TextStyle(color: BunkieColors.dark))
        ],
      ),
    );
  }

  static Container _getDescription(String description) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Description",
            textScaleFactor: BunkieText.large,
            style: TextStyle(color: BunkieColors.slate)),
        const SizedBox(
          height: 10,
        ),
        Text(description, style: const TextStyle(color: BunkieColors.dark)),
      ]),
    );
  }
}
