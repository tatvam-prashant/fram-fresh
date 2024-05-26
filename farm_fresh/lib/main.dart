import 'dart:io';
import 'package:farm_fresh/auth/sign_in.dart';
import 'package:farm_fresh/screens/home_screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyBlHJoqR10_w3Z_LZC8vV8mppjJuJAkc-U",
            appId: "1:803830166797:android:176fe01680cee7557aac44",
            messagingSenderId: "803830166797",
            projectId: "farm-fresh-20426",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
