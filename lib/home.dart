import 'dart:async';

import 'package:binary_bandits_hnc/geography_home.dart';
import 'package:binary_bandits_hnc/history_page.dart';
import 'package:binary_bandits_hnc/language_page.dart';
import 'package:binary_bandits_hnc/profile_page.dart';
import 'package:binary_bandits_hnc/science_home.dart';
import 'package:binary_bandits_hnc/tech_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'leaderboard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  int streak = 1;
  DateTime? lastLogin;

  void checkStreak() async {
    firestore
        .collection('UserData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      debugPrint(value.data().toString());
      setState(() {
        streak = value.data()!['streak'] ?? 1;
        lastLogin = value.data()!['lastLogin']?.toDate();
      });
    });
    if (lastLogin == null) {
      firestore
          .collection('UserData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'lastLogin': DateTime.now(),
        'streak': 1,
      });
    } else {
      final difference = DateTime.now().difference(lastLogin!);
      if (difference.inDays >= 1) {
        firestore
            .collection('UserData')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'lastLogin': DateTime.now(),
          'streak': streak + 1,
        });
        setState(() {
          streak++;
        });
      }
    }
    Timer(const Duration(seconds: 1), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Streak Check'),
            content: Text('Your current streak is $streak days'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok, got it!'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  void initState() {
    checkStreak();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Welcome ${FirebaseAuth.instance.currentUser!.displayName}'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LeaderboardPage(),
                ),
              );
            },
            icon: const Icon(Icons.leaderboard),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Tech_Home(),
                ),
              );
            },
            child: Card(
              child: Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                    image: const AssetImage(
                      'assets/tech.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  title: Text(
                    'Code',
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LanguagePage(),
                ),
              );
            },
            child: Card(
              child: Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                    image: const AssetImage(
                      'assets/lang.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  title: Text(
                    'Language',
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScienceHome(),
                ),
              );
            },
            child: Card(
              child: Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                    image: const AssetImage(
                      'assets/science.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  title: Text(
                    'Science',
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()));
            },
            child: Card(
              child: Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                    image: const AssetImage(
                      'assets/history.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  title: Text(
                    'History',
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GeographyHome()));
            },
            child: Card(
              child: Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                    image: const AssetImage(
                      'assets/geography.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  title: Text(
                    'Geography',
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final apiKey = dotenv.env['GEMINI_API_KEY'] ?? "";
          final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Learn Something New!'),
                content: FutureBuilder(
                  future: model.generateContent(
                    [Content.text("Give me a fun educational fact!")],
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      );
                    }
                    return Text(snapshot.data?.text ?? "An error occurred");
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok, got it!'),
                  ),
                ],
              );
            },
          );
        },
        label: const Text('Learn Something New!'),
        icon: const Icon(Icons.bolt),
      ),
    );
  }
}
