// ignore_for_file: unused_import, use_key_in_widget_constructors

import 'package:codeastra/firebase_options.dart';
import 'package:codeastra/net.dart';
import 'package:codeastra/screen_1/login_auth.dart';
import 'package:codeastra/screen_1/login_signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: AuthPage()
    );
  }
}
