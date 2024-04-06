import 'package:binary_bandits_hnc/firebase_options.dart';
import 'package:binary_bandits_hnc/main_page.dart';
import 'package:binary_bandits_hnc/verfiy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  runApp(
    MaterialApp(
      initialRoute: 'main',
      theme: ThemeData(
        fontFamily: 'Jura',
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        'phone': (context) => const MyPhone(),
        'verify': (context) => const MyVerify(),
        'main': (context) => const main_page(),
      },
    ),
  );
}
