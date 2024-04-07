import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final auth = FirebaseAuth.instance;
  int streak = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void checkStreak() {
    firestore
        .collection('UserData')
        .doc(auth.currentUser?.uid)
        .get()
        .then((documentSnapshot) {
      setState(() {
        streak = documentSnapshot.data()?['streak'] ?? 0;
      });
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
        title: const Text('Your Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              const CircleAvatar(
                radius: 75,
                child: Icon(
                  Icons.person,
                  size: 125,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                auth.currentUser?.displayName ?? "No Name",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                auth.currentUser?.phoneNumber ?? "No Phone Number",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                "Streak: $streak",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  await auth.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'main',
                    (route) => false,
                  );
                },
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
