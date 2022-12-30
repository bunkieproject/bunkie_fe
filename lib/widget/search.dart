import 'package:app/constants.dart';
import 'package:app/widget/form.dart';
import 'package:flutter/material.dart';

class BunkieSearchPageWidgets {
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
    GlobalKey<FormState> formKey,
    BuildContext context,
    double width,
    double height,
  ) {
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
                            _getRow(width, height * 0.075, "House Size", "Size"),
                            _getRow(width, height * 0.075, "Gender", "Gender"),
                            _getRow(width, height * 0.075, "School", "School"),
                            _getRow(width, height * 0.075, "City", "City"),
                            _getRow(width, height * 0.075, "District", "District"),
                            _getRow(width, height * 0.075, "Quarter", "Quarter"),
                            BunkieFormWidgets.getSubmitButton(
                                () {},
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
            textScaleFactor: BunkieText.medium,
            style: const TextStyle(color: BunkieColors.dark),
          ),
        ));
  }

  static SizedBox _getDefaultTextFormField(
      double width, double height, String placeholder) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
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
            _getDefaultTextFormField(width * 0.25, height * 0.5, "Lower Limit"),
            SizedBox(
              width: width * 0.0125,
            ),
            const Text("-"),
            SizedBox(
              width: width * 0.0125,
            ),
            _getDefaultTextFormField(width * 0.25, height * 0.5, "Upper Limit")
          ],
        ));
  }

  static SizedBox _getRow(
      double width, double height, String label, String placeholder) {
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
            _getDefaultTextFormField(width * 0.35, height * 0.5, placeholder)
          ],
        ));
  }

  static Column getHouseAdList(Iterable? adList) {
    List<Widget> adWidgets = <Widget>[];
    for (var each in adList!) {
      adWidgets.add(
        Container(
          padding: EdgeInsets.all(15),
          color: Colors.white,
          child: Container(
            
          ),
        )
      );
    }

    return Column(
      children: [

      ],
    );
  }

  static Column getBunkieAdList(Iterable? adList) {
    List<Widget> adWidgets = <Widget>[];
    for (var each in adList!) {
      adWidgets.add(
        Container(
          padding: EdgeInsets.all(15),
          color: Colors.white,
          child: Container(
            
          ),
        )
      );
    }

    return Column(
      children: [

      ],
    );
  }
}
