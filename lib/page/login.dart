import 'package:app/constants.dart';
import 'package:app/page/forgotten_password.dart';
import 'package:app/page/register.dart';
import 'package:app/widget/form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          // Login Page:  Login Form | Register Message
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
                                  "Login to your\naccount", BunkieColors.light),
                              SizedBox(height: screenHeight * 0.05),
                              Form(
                                  key: _loginFormKey,
                                  child: Column(
                                    // Form : Username | Password
                                    children: [
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
                                      TextButton(
                                          onPressed: () => {
                                                _navigateToForgottenPasswordPage(
                                                    context)
                                              },
                                          child: const Text(
                                            "Forgotten password?",
                                            style: TextStyle(
                                                color: BunkieColors.dark),
                                          ))
                                    ],
                                  )),
                              SizedBox(height: screenHeight * 0.05),
                              // Button
                              BunkieFormWidgets.getSubmitButton(
                                _loginAction,
                                screenWidth * 0.3,
                                screenHeight * 0.055,
                                BunkieColors.dark,
                                "Login",
                                BunkieColors.light,
                              )
                            ]),
                      )),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Register Message
              children: [
                const Text("Don't you have any accounts?"),
                TextButton(
                    onPressed: () => {_navigateToRegisterPage(context)},
                    child: const Text(
                      "Register",
                      style: TextStyle(color: BunkieColors.bright),
                    ))
              ],
            )
          ],
        )));
  }

  String? _usernameFormValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your username";
    } else {
      return null;
    }
  }

  String? _passwordFormValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    } else {
      return null;
    }
  }

  void _navigateToForgottenPasswordPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ForgottenPasswordPage()));
  }

  void _navigateToRegisterPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  void _loginAction() {
    if (_loginFormKey.currentState!.validate()) {
      // TO DO : if form is valid, talk to backend
      print("Talking to backend about Register");
    }
  }
}
