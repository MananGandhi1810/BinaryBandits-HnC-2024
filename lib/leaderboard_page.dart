import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List leaderboard = [];
  FirebaseAuth auth = FirebaseAuth.instance;

  void loadLeaderboard() {
    firestore
        .collection('UserData')
        .orderBy('streak', descending: true)
        .limit(10)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        setState(() {
          leaderboard.add({
            'name': document.data()['name'],
            'streak': document.data()['streak'],
          });
        });
      });
    });
  }

  @override
  void initState() {
    loadLeaderboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: leaderboard.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              leaderboard[index]['name'] == auth.currentUser?.displayName
                  ? leaderboard[index]['name'] + ' (You)'
                  : leaderboard[index]['name'],
              style: const TextStyle(fontSize: 18),
            ),
            trailing: Text(leaderboard[index]['streak'].toString(),
                style: const TextStyle(fontSize: 14)),
          );
        },
      ),
    );
  }
}
