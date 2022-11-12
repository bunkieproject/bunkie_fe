import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: BunkieColors.light,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
                width: screenWidth * 0.75,
                color: BunkieColors.bright,
                padding: const EdgeInsets.all(25),
                child: Form(
                    key: _registerFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Join to bunkie,\nfind flatmates",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: BunkieColors.light),
                            textScaleFactor: BunkieText.large),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email.";
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: BunkieColors.light,
                                prefixIcon: Icon(Icons.email),
                                labelText: "Email",
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.5))))),
                        SizedBox(
                          height: screenHeight * 0.0125,
                        ),
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a username.";
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: BunkieColors.light,
                                prefixIcon: Icon(Icons.person),
                                labelText: "Username",
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.5))))),
                        SizedBox(
                          height: screenHeight * 0.0125,
                        ),
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a password.";
                              } else {
                                return null;
                              }
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: BunkieColors.light,
                                prefixIcon: Icon(Icons.lock),
                                labelText: "Password",
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.5))))),
                        SizedBox(
                          height: screenHeight * 0.0125,
                        ),
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter the password again.";
                              } else {
                                return null;
                              }
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: BunkieColors.light,
                                prefixIcon: Icon(Icons.lock),
                                labelText: "Password Confirmation",
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.5))))),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: ElevatedButton(
                              onPressed: () {
                                if (_registerFormKey.currentState!.validate()) {
                                  // TO DO : if form is valid, talk to backend
                                  print("Talking to backend about Register");
                                }
                              },
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.only(
                                          top: 20,
                                          right: 40,
                                          bottom: 20,
                                          left: 40)),
                                  backgroundColor: MaterialStateProperty.all(
                                      BunkieColors.dark)),
                              child: const Text("Register",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: BunkieColors.light),
                                  textScaleFactor: BunkieText.medium)),
                        )
                      ],
                    ))),
          )
        ],
      )),
    );
  }
}
