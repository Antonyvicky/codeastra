import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart'; 
import 'package:codeastra/config/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;
  bool _acceptedTerms = false;

  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();

  void signUserIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailCont.text,
      password: passwordCont.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              height: 300,
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                color: Colors.orange,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome",
                          style: const TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? " Home," : " Back,",
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? "Signup to Continue"
                          : "Signin to Continue",
                      style: const TextStyle(
                        letterSpacing: 1,
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 440 : 250,
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          // Bottom buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 150,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(isSignupScreen ? "Or Signup with" : "Or Signin with"),
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Logo(Logos.facebook_f),
                      Logo(Logos.google),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.mail_outline, "email", false, true, emailCont),
          buildTextField(const IconData(0xf1ac, fontFamily: 'MaterialIcons'),
              "password", true, false, passwordCont),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  const Text("Remember me",
                      style: TextStyle(fontSize: 12, color: Palette.textColor1))
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Forgot Password?",
                    style: TextStyle(fontSize: 12, color: Palette.textColor1)),
              )
            ],
          )
        ],
      ),
    );
  }

  void _showTermsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Terms and Conditions"),
        content: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " Users' soil test data should be securely stored and protected. The app must have a clear privacy policy outlining how user data is collected, used, and shared. Consent should be obtained before collecting any personal information.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 12),
                Text(
                  " The app should provide accurate and reliable soil test results. Clearly communicate the limitations of the app, such as the types of soil it can analyze and any factors that may affect the accuracy of the results.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 12),
                Text(
                  " Clearly outline the intended use of the soil test app and any restrictions on its use. Users should be informed if the app is for personal or professional use and if there are any limitations on the number of tests or the frequency of use.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 12),
                Text(
                  "Include a disclaimer stating that the app is not a substitute for professional advice. Make it clear that the developers and owners of the app are not liable for any consequences resulting from the use of the app, and users should seek professional guidance for critical decisions based on soil test results.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _acceptedTerms = true;
              });
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Change the color to blue
            ),
            child: const Text("Accept"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _acceptedTerms = false;
              });
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Change the color to red
            ),
            child: const Text(
              "Decline",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(const IconData(0xf1ac, fontFamily: 'MaterialIcons'),
              "User Name", false, false),
          buildTextField(const IconData(0xe3c4, fontFamily: 'MaterialIcons'),
              "email", false, true),
          buildTextField(const IconData(0xe3b1, fontFamily: 'MaterialIcons'),
              "password", true, false),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale
                                ? Palette.textColor2
                                : Colors.transparent,
                            border: Border.all(
                                width: 1,
                                color: isMale
                                    ? Colors.transparent
                                    : Palette.textColor1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          const IconData(0xf1ac, fontFamily: 'MaterialIcons'),
                          color: isMale ? Colors.white : Palette.iconColor,
                        ),
                      ),
                      const Text(
                        "Male",
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale
                                ? Colors.transparent
                                : Palette.textColor2,
                            border: Border.all(
                                width: 1,
                                color: isMale
                                    ? Palette.textColor1
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          const IconData(0xf1ac, fontFamily: 'MaterialIcons'),
                          color: isMale ? Palette.iconColor : Colors.white,
                        ),
                      ),
                      const Text(
                        "Female",
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 500,
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        child: Text(
                          "By pressing 'Accept' you agree to our ",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Palette.textColor2),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showTermsDialog();
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 40), // Adjust the width as needed
                                Text(
                                  'Terms and Conditions',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Text(
                                  "  ",
                                ),
                              ],
                            ),
                          ),
                          Checkbox(
                            value: _acceptedTerms,
                            onChanged: (value) {
                              setState(() {
                                _acceptedTerms = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {
        
      },
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(width: 1, color: Colors.grey),
          minimumSize: const Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 590 : 430,
      right: 0,
      left: 0,
      child: Center(
        child: GestureDetector(
          onTap: signUserIn,
          child: Container(
            height: 90,
            width: 90,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ],
            ),
            child: !showShadow
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      gradient: const LinearGradient(
                        colors: [Colors.orange, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                : const Center(),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      IconData icon, String hintText, bool isPassword, bool isEmail, [TextEditingController? controller]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }
}
