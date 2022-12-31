import 'package:flutter/material.dart';

class BunkieColors {
  static const Color light = Color(0xFFDCE5FC);
  static const Color dark = Color(0xFF041F57);
  static const Color solid = Color(0xFF0015D6);
  static const Color bright = Color(0xFF0989FB);
  static const Color slate = Color(0xFF18336B);
  static const Color transparentSlate = Color.fromRGBO(24, 51, 107, 0.25);
  static const Color greenygreen = Color(0XFF87EE7F);
}

class BunkieText {
  static const double medium = 1.25;
  static const double large = 1.5;
  static const double xlarge = 1.75;
  static const double small = 0.65;
}

class BunkieAddress {
  static const String protocol = "https";
  static const String host = "bunkie-backend-foja2uwzca-ey.a.run.app";
  static const String domain = "$protocol://$host";

  static String getRoute(String service) {
    return "$domain/$service";
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: BunkieColors.slate,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
);
