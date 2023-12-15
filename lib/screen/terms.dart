// ignore_for_file: duplicate_import, unused_import

import 'package:codeastra/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:codeastra/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart' as icons;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _acceptedTerms = false;

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
                  "2. **Accuracy of Results:** The app should provide accurate and reliable soil test results. Clearly communicate the limitations of the app, such as the types of soil it can analyze and any factors that may affect the accuracy of the results.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 12),
                Text(
                  "3. **Usage Restrictions:** Clearly outline the intended use of the soil test app and any restrictions on its use. Users should be informed if the app is for personal or professional use and if there are any limitations on the number of tests or the frequency of use.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 12),
                Text(
                  "4. **Liability and Disclaimer:** Include a disclaimer stating that the app is not a substitute for professional advice. Make it clear that the developers and owners of the app are not liable for any consequences resulting from the use of the app, and users should seek professional guidance for critical decisions based on soil test results.",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms and conditions"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Checkbox(
                    value: _acceptedTerms,
                    onChanged: (value) {
                      setState(() {
                        _acceptedTerms = value!;
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      _showTermsDialog();
                    },
                    child: const Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_acceptedTerms) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()));
                } else {
                  // Show a message or handle the case where terms are not accepted
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
              ),
              child: const Text('Get Started',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
