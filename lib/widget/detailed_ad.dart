import 'dart:convert';

import 'package:app/api/util.dart';
import 'package:app/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class BunkieDetailedAdWidgets {
  static Center getHouseAdDetails(BuildContext context, String token,
      String userID, Map<String, dynamic> adDetail) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          _getHeader(adDetail["header"]),
          const SizedBox(
            height: 25,
          ),
          _getHeaderPhoto(screenWidth, screenHeight, context,
              adDetail["header_bytearray"], adDetail["other_bytearrays"]),
          const SizedBox(
            height: 25,
          ),
          _getVisitButton(
              context, token, userID, adDetail["user_id"], adDetail["ad_id"]),
          const SizedBox(
            height: 25,
          ),
          _getSpeficiations(
              adDetail["price"].toString(),
              "${adDetail["city"]} / ${adDetail["district"]} / ${adDetail["quarter"]}",
              adDetail["number_of_rooms"],
              adDetail["gender_preferred"],
              adDetail["school"]),
          const SizedBox(
            height: 12.5,
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
            color: BunkieColors.slate,
          ),
          const SizedBox(
            height: 12.5,
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
          _getVisitButton(
              context, token, userID, adDetail["user_id"], adDetail["ad_id"]),
          const SizedBox(
            height: 25,
          ),
          _getSpeficiations(
              adDetail["price"].toString(),
              "${adDetail["city"]} / ${adDetail["district"]} / ${adDetail["quarter"]}",
              adDetail["number_of_rooms"],
              adDetail["gender_preferred"],
              adDetail["school"]),
          const SizedBox(
            height: 12.5,
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
            color: BunkieColors.slate,
          ),
          const SizedBox(
            height: 12.5,
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

  static Container _getHeaderPhoto(double screenWidth, double screenHeight,
      BuildContext context, String? header_img, String? other_imgs) {
    final images = [];
    String header = header_img ?? "null";
    String others = other_imgs ?? "null";

    if (header_img != "null") {
      Uint8List bytes = Base64Decoder().convert(header);
      images.add(bytes);
    }
    if (other_imgs != "null") {
      final splitted = others.split(',');
      for (var each in splitted) {
        Uint8List converted_img = Base64Decoder().convert(each);
        images.add(converted_img);
      }
    }
    if (header == "null") {
      return Container();
    } else {
      // ignore: sized_box_for_whitespace
      return Container(
        width: screenWidth * 0.8,
        height: screenHeight * 0.4,
        child: PhotoViewGallery.builder(
          scrollDirection: Axis.horizontal,
          scrollPhysics: const BouncingScrollPhysics(),
          itemCount: images.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
                imageProvider: MemoryImage(images[index]),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.contained * 4);
          },
          backgroundDecoration: BoxDecoration(color: BunkieColors.light),
        ),
      );
    }
  }

  static Container _getVisitButton(BuildContext context, String token,
      String userID, String ownerID, String adID) {
    Map<String, dynamic> displayProfileForm;
    displayProfileForm = <String, dynamic>{"user_id": ownerID};

    return Container(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
            onPressed: () => {
                  BunkieUtil.navigateToProfilePage(
                      context, token, userID, displayProfileForm, false)
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
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("Specifications",
                textScaleFactor: BunkieText.large,
                style: TextStyle(color: BunkieColors.slate)),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: 150,
                  child: Text("Price: $price TL",
                      style: const TextStyle(color: BunkieColors.dark)),
                ),
                const SizedBox(
                  height: 7.5,
                ),
                SizedBox(
                  width: 150,
                  child: Text("Size: $size",
                      style: const TextStyle(color: BunkieColors.dark)),
                ),
                const SizedBox(
                  height: 7.5,
                ),
                SizedBox(
                  width: 150,
                  child: Text("School: $school",
                      style: const TextStyle(color: BunkieColors.dark)),
                ),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: 150,
                  child: Text("Location: $loc",
                      style: const TextStyle(color: BunkieColors.dark)),
                ),
                const SizedBox(
                  height: 7.5,
                ),
                SizedBox(
                  width: 150,
                  child: Text("Gender: $gender",
                      style: const TextStyle(color: BunkieColors.dark)),
                ),
              ]),
            ],
          )
        ]));
  }

  static Container _getDescription(String description) {
    return Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.centerLeft,
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
