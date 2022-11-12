import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                height: screenHeight * 0.65,
                color: BunkieColors.bright,
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Join to bunkie,\nfind flatmates",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: BunkieColors.light),
                        textScaleFactor: BunkieText.large),
                    SizedBox(
                      height: screenHeight * 0.0125,
                    ),
                    TextFormField(
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: BunkieColors.light,
                            prefixIcon: Icon(Icons.email),
                            labelText: "Email",
                            border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))))),
                    TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: BunkieColors.light,
                            prefixIcon: Icon(Icons.person),
                            labelText: "Username",
                            border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))))),
                    TextFormField(
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: BunkieColors.light,
                            prefixIcon: Icon(Icons.lock),
                            labelText: "Password",
                            border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))))),
                    TextFormField(
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: BunkieColors.light,
                            prefixIcon: Icon(Icons.lock),
                            labelText: "Password Confirmation",
                            border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))))),
                    SizedBox(
                      height: screenHeight * 0.0125,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: ElevatedButton(
                          onPressed:
                              null, // TO DO : Tries to Register, otherwise prints error
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.only(
                                      top: 20,
                                      right: 40,
                                      bottom: 20,
                                      left: 40)),
                              backgroundColor:
                                  MaterialStateProperty.all(BunkieColors.dark)),
                          child: const Text("Register",
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
