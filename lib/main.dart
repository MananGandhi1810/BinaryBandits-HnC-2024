import 'package:binary_bandits_hnc/firebase_options.dart';
import 'package:binary_bandits_hnc/main_page.dart';
import 'package:binary_bandits_hnc/verfiy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      initialRoute: 'phone',
      theme: ThemeData(fontFamily: 'Jura'),
      debugShowCheckedModeBanner: false,
      routes: {
        'phone': (context) => MyPhone(),
        'verify': (context) => MyVerify(),
        'main': (context) => main_page(),
      },
    ),
  );
}
