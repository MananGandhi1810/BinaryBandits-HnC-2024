import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class LanguageLearningPage extends StatefulWidget {
  const LanguageLearningPage({super.key, required this.language});

  final String language;

  @override
  State<LanguageLearningPage> createState() => _LanguageLearningPageState();
}

class _LanguageLearningPageState extends State<LanguageLearningPage> {
  final List<Map<String, String>> words = [
    {
      "word": "Hello",
      "translation": "Hola",
    },
    {
      "word": "Goodbye",
      "translation": "Adiós",
    },
    {
      "word": "Please",
      "translation": "Por favor",
    },
    {
      "word": "Thank you",
      "translation": "Gracias",
    },
    {
      "word": "Yes",
      "translation": "Sí",
    },
    {
      "word": "No",
      "translation": "No",
    },
    {
      "word": "Excuse me",
      "translation": "Perdón",
    },
    {
      "word": "I'm sorry",
      "translation": "Lo siento",
    },
    {
      "word": "I don't understand",
      "translation": "No entiendo",
    },
    {
      "word": "How much?",
      "translation": "¿Cuánto cuesta?",
    }
  ];
  FlutterTts tts = FlutterTts();

  @override
  void dispose() {
    tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn ${widget.language}'),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(words[index]['word']!),
            subtitle: Text(words[index]['translation']!),
            trailing: IconButton(
              icon: const Icon(Icons.volume_up),
              onPressed: () async {
                await tts.setLanguage('en');
                await tts.speak(words[index]['word']!);
                Timer(const Duration(seconds: 1), () async {
                  await tts.setLanguage('es');
                  await tts.speak(words[index]['translation']!);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
