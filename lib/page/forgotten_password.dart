import 'package:app/constants.dart';
import 'package:app/widget/form.dart';
import 'package:flutter/material.dart';

class ForgottenPasswordPage extends StatefulWidget {
  const ForgottenPasswordPage({super.key});

  @override
  _ForgottenPasswordPageState createState() => _ForgottenPasswordPageState();
}

class _ForgottenPasswordPageState extends State<ForgottenPasswordPage> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: BunkieColors.light,
        body: Center(
            child: Wrap(
          alignment: WrapAlignment.center,
          // Forgotten Password Page : Forgotten Password Form
          children: [
            SizedBox(
                width: screenWidth * 0.75,
                height: screenHeight * 0.55,
                child: SingleChildScrollView(
                  child: Card(
                      color: BunkieColors.bright,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Container(
                        padding: const EdgeInsets.all(25.0),
                        child:
                            Column(mainAxisAlignment: MainAxisAlignment.center,
                                // Login Form: Message | Form | Button
                                children: [
                              // Message
                              BunkieFormWidgets.getFormMessage(
                                  "Reset your\npassword", BunkieColors.light),
                              SizedBox(height: screenHeight * 0.05),
                              Form(
                                  key: _loginFormKey,
                                  child: Column(
                                    // Form : Email | Username
                                    children: [
                                      // Username
                                      BunkieFormWidgets.getTextFormField(
                                          false,
                                          "Email",
                                          Icons.email,
                                          _emailFormValidator),
                                      SizedBox(height: screenHeight * 0.0125),
                                      // Password
                                      BunkieFormWidgets.getTextFormField(
                                          false,
                                          "Username",
                                          Icons.person,
                                          _usernameFormValidator),
                                    ],
                                  )),
                              SizedBox(height: screenHeight * 0.05),
                              // Button
                              BunkieFormWidgets.getSubmitButton(
                                _forgottenPasswordAction,
                                screenWidth * 0.3,
                                screenHeight * 0.055,
                                BunkieColors.dark,
                                "Reset",
                                BunkieColors.light,
                              )
                            ]),
                      )),
                )),
          ],
        )));
  }

  String? _emailFormValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your email";
    } else if (!value.contains("@")) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  String? _usernameFormValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your username";
    } else {
      return null;
    }
  }

  void _forgottenPasswordAction() {
    if (_loginFormKey.currentState!.validate()) {
      // TO DO : if form is valid, talk to backend
      print("Talking to backend about Forgotten Password");
    }
  }
}
