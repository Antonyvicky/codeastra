import 'package:codeastra/screen/signin_screen.dart';
import 'package:codeastra/screen/signup_screen.dart';
import 'package:codeastra/themes.dart';
import 'package:codeastra/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/bg12.png', // Replace with the path to your image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Content
          Column(
            children: [
              Flexible(
                flex: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 40.0,
                  ),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome you with pleasure!\n',
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: '\nlogin to access all the future of the app',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              // height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FractionalTranslation(
                    translation: const Offset(0.0, -0.3),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: lightColorScheme.primary,
                              backgroundColor: Colors.white,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 54, 99, 213),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: lightColorScheme.primary,
                              backgroundColor: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: lightColorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
