import 'package:binary_bandits_hnc/language_page.dart';
import 'package:binary_bandits_hnc/tech_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${FirebaseAuth.instance.currentUser!.displayName}'),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Tech_Home()));
              },
              title: const Text('Technology'),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LanguagePage()));
              },
              title: const Text('Language'),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text('Science'),
            ),
          ),
        ],
      ),
    );
  }
}
