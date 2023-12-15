// ignore_for_file: unused_import

import 'package:codeastra/firebase_options.dart';
import 'package:codeastra/screen/terms.dart';
import 'package:codeastra/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home: const MyHomePage(
        key: Key("key"), // Use const Key for efficiency
        title: 'Terms and Conditions', // Capitalized title
      ),
    );
  }
}
