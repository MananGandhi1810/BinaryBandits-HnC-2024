import 'package:binary_bandits_hnc/language_page.dart';
import 'package:binary_bandits_hnc/science_home.dart';
import 'package:binary_bandits_hnc/tech_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  void checkStreak() async {
    int streak = int.parse(await storage.read(key: 'streak') ?? '0');
    DateTime lastLogin = DateTime.parse(await storage.read(key: 'lastLogin') ??
        DateTime.now().toIso8601String());
    DateTime now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day);
    final last = DateTime(lastLogin.year, lastLogin.month, lastLogin.day);
    debugPrint('Last login: $last');
    debugPrint('Today: $date');
    if (date.difference(last).inDays > 1) {
      streak = 0;
    } else if (date.difference(last).inDays == 1) {
      streak++;
    }
    await storage.write(key: 'streak', value: streak.toString());
    await storage.write(key: 'lastLogin', value: now.toIso8601String());
    if (streak > 0) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Congratulations!'),
            content: Text('You have a streak of $streak days. Keep it up!'),
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
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Welcome back!'),
            content: const Text('We missed you! Start your streak today!'),
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
    }
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
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Tech_Home()));
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
                      builder: (context) => const LanguagePage()));
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
