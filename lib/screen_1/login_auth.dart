import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:codeastra/screen_1/login_signup.dart';
import 'package:codeastra/home_g.dart';

@override
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return HomePage_1();
          }else{
            return const LoginSignupScreen();
          }
        },
      ),
    );
  }
}