import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'language_learning_page.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String fromLanguage = 'English';
  String toLanguage = 'Spanish';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn a Language'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text("You know: "),
                DropdownButton(
                  items: ["English", "Spanish", "Hindi", "French", "German"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  value: fromLanguage,
                  onChanged: (value) {
                    setState(() {
                      fromLanguage = value ?? 'English';
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                const Text("You want to learn: "),
                DropdownButton(
                  items: ["English", "Spanish", "Hindi", "French", "German"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  value: toLanguage,
                  onChanged: (value) {
                    setState(() {
                      toLanguage = value ?? 'Spanish';
                    });
                  },
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Learn!"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LanguageLearningPage(
                        fromLanguage: fromLanguage,
                        toLanguage: toLanguage,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
