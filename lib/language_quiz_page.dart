import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class LanguageQuizPage extends StatefulWidget {
  const LanguageQuizPage(
      {super.key,
      required this.fromLanguage,
      required this.toLanguage,
      required this.context});

  final String fromLanguage;
  final String toLanguage;
  final String context;

  @override
  State<LanguageQuizPage> createState() => _LanguageQuizPageState();
}

class _LanguageQuizPageState extends State<LanguageQuizPage> {
  List content = [];
  final TextEditingController _controller = TextEditingController();
  late String apiKey;
  late GenerativeModel model;
  late ChatSession chat;

  void startQuiz() {
    String prompt =
        "Generate a 4-question quiz to test my knowledge of ${widget.toLanguage} based on the following text: ${widget.context}. Ask me one question at a time, and provide me with multiple choice answers. Once I answer one question, ask me the next one. I am a total beginner";
    chat.sendMessage(Content.text(prompt)).then((value) {
      setState(() {
        content.add(value.text);
      });
    });
  }

  void answerQuiz() {
    String prompt = "My Answers: ${_controller.text}";
    final data = Content.text(prompt);
    setState(() {
      content.add(prompt);
    });
    chat.sendMessage(data).then((value) {
      setState(() {
        content.add(value.text);
      });
    });
  }

  @override
  void initState() {
    apiKey = dotenv.env['GEMINI_API_KEY'] ?? "";
    model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    chat = model.startChat(history: []);
    startQuiz();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: content.isNotEmpty
                  ? ListView.builder(
                      itemCount: content.length,
                      itemBuilder: (context, index) {
                        return ListTile(subtitle: Text(content[index]));
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your answer here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    answerQuiz();
                    _controller.clear();
                  },
                  icon: const Icon(Icons.send),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
