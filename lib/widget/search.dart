import 'package:app/constants.dart';
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
            titlePadding: const EdgeInsets.all(25),
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
            content: SizedBox(
                width: width,
                height: height,
                child: Form(
                    key: formKey,
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        _getPriceRow(width, height * 0.1),
                        _getSizeRow(width, height * 0.1),
                      ],
                    ))),
            contentTextStyle: const TextStyle(color: BunkieColors.slate),
          );
        });
  }

  static SizedBox _getPriceRow(double width, double height) {
    return SizedBox(
        width: width,
        height: height,
        child: Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _getLabel(width * 0.1, height * 0.5, "Price"),
            SizedBox(
              width: width * 0.025,
            ),
            _getPriceTextFormField(width * 0.25, height * 0.5, "Lower Limit"),
            SizedBox(
              width: width * 0.0125,
            ),
            const Text("-"),
            SizedBox(
              width: width * 0.0125,
            ),
            _getPriceTextFormField(width * 0.25, height * 0.5, "Upper Limit")
          ],
        ));
  }

  static SizedBox _getSizeRow(double width, double height) {
    return SizedBox(
        width: width,
        height: height,
        child: Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _getLabel(width * 0.1, height * 0.5, "Size"),
            SizedBox(
              width: width * 0.025,
            ),
            _getSizeFormField()
          ],
        ));
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

  static SizedBox _getPriceTextFormField(
      double width, double height, String label) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          label: Text(
            label,
            textScaleFactor: BunkieText.small,
            style: const TextStyle(color: Colors.black54),
          ),
          floatingLabelAlignment: FloatingLabelAlignment.center,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.5))),
        ),
      ),
    );
  }

  static SizedBox _getSizeFormField() {
    return SizedBox();
  }
}
