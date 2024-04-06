import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'language_quiz_page.dart';

class LanguageLearningPage extends StatefulWidget {
  const LanguageLearningPage(
      {super.key, required this.fromLanguage, required this.toLanguage});

  final String fromLanguage;
  final String toLanguage;

  @override
  State<LanguageLearningPage> createState() => _LanguageLearningPageState();
}

class _LanguageLearningPageState extends State<LanguageLearningPage> {
  String? languageText;

  void generateText() {
    final apiKey = dotenv.env['GEMINI_API_KEY'] ?? "";
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    final text =
        "I know ${widget.fromLanguage} and I want to learn ${widget.toLanguage}, teach me now. I am a total beginner";
    final prompt = [Content.text(text)];
    model.generateContent(prompt).then((value) {
      setState(() {
        languageText = value.text;
      });
    });
  }

  @override
  void initState() {
    generateText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn a Language'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: languageText == null
            ? const Center(child: CircularProgressIndicator())
            : Markdown(data: languageText!),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LanguageQuizPage(
              fromLanguage: widget.fromLanguage,
              toLanguage: widget.toLanguage,
              context: languageText!,
            );
          }));
        },
        label: const Text('Take Quiz'),
        icon: const Icon(Icons.quiz),
      ),
    );
  }
}
