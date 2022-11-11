import 'package:app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                width: screenWidth * 0.65,
                height: screenHeight * 0.50,
                color: BunkieColors.bright,
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Login to your account",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: BunkieColors.light),
                        textScaleFactor: BunkieText.large),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    TextFormField(
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: BunkieColors.light,
                            prefixIcon: Icon(Icons.person),
                            labelText: "Username",
                            border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))))),
                    SizedBox(
                      height: screenHeight * 0.025,
                    ),
                    TextFormField(
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: BunkieColors.light,
                            prefixIcon: Icon(Icons.lock),
                            labelText: "Password",
                            border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))))),
                    const TextButton(
                      onPressed: null,
                      child: Text("Forgotten Password?",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: BunkieColors.dark),
                          textScaleFactor: BunkieText.medium),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(BunkieColors.dark)),
                          child: const Text("Log In",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: BunkieColors.light),
                              textScaleFactor: BunkieText.medium)),
                    )
                  ],
                )),
          )
        ],
      )),
    );
  }
}
