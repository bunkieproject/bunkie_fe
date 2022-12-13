import 'package:app/api/auth.dart';
import 'package:app/constants.dart';
import 'package:app/widget/form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();
  Map<String, String> _registerFormData = Map<String, String>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: BunkieColors.light,
        body: Center(
            child: Wrap(
          alignment: WrapAlignment.center,
          // Register Page:  Register Form
          children: [
            SizedBox(
                width: screenWidth * 0.75,
                height: screenHeight * 0.75,
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
                                  "Join to bunkie,\nfind flatmates",
                                  BunkieColors.light),
                              SizedBox(height: screenHeight * 0.05),
                              Form(
                                  key: _registerFormKey,
                                  child: Column(
                                    // Form : Email | Username | Password | Password Confirmation
                                    children: [
                                      // Email
                                      BunkieFormWidgets.getTextFormField(
                                          false,
                                          "Email",
                                          Icons.email,
                                          _emailFormValidator),
                                      SizedBox(height: screenHeight * 0.0125),
                                      // Username
                                      BunkieFormWidgets.getTextFormField(
                                          false,
                                          "Username",
                                          Icons.person,
                                          _usernameFormValidator),
                                      SizedBox(height: screenHeight * 0.0125),
                                      // Password
                                      BunkieFormWidgets.getTextFormField(
                                          true,
                                          "Password",
                                          Icons.person,
                                          _passwordFormValidator),
                                      SizedBox(height: screenHeight * 0.0125),
                                      // Password Confirmation
                                      BunkieFormWidgets.getTextFormField(
                                          true,
                                          "Password (Again)",
                                          Icons.person,
                                          _passwordConfirmationFormValidator),
                                    ],
                                  )),
                              SizedBox(height: screenHeight * 0.05),
                              // Button
                              BunkieFormWidgets.getSubmitButton(
                                () {BunkieAuthAPI.registerAction(context, _registerFormKey, _registerFormData);},
                                screenWidth * 0.3,
                                screenHeight * 0.055,
                                BunkieColors.dark,
                                "Register",
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
    } else if (!value.contains("@gmail.com") && !value.contains("@yahoo.com") && !value.contains("@outlook.com")){
      return "Please enter a valid email";
    } else {
      _registerFormData['email'] = value;
      return null;
    }
  }

  String? _usernameFormValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your username";
    } else {
      _registerFormData['username'] = value;
      return null;
    }
  }

  String? _passwordFormValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    } else {
      _registerFormData['password'] = value;
      return null;
    }
  }

  String? _passwordConfirmationFormValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    } else if (_registerFormData['password'] != value) {
        return "Passwords can not be different";
    } else {
      _registerFormData['password_confirm'] = value;
      return null;
    }
  }
}
