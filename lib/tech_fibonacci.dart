import 'dart:io';

import 'package:code_editor/code_editor.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';


class Fibonacci extends StatefulWidget {
  const Fibonacci({Key? key}) : super(key: key);

  @override
  State<Fibonacci> createState() => _FibonacciState();
}

class _FibonacciState extends State<Fibonacci> {
  int count = 0;
  late EditorModel model;
  List<String> content = [
    "def fibonacci(n):",
     "  if n <= 1:",
    "    return n  # Starts with 1 pair, then 1 adult pair after 1 month",
    "  else:",
    "    return fibonacci(n-1) + fibonacci(n-2)  # New pairs = previous month + babies from adults",
    "# Let's see how many pairs we have after 5 months!",
    "num_months = 5",
    "total_pairs = fibonacci(num_months)",
    "print('After', num_months, 'months, we have', total_pairs, 'rabbit pairs!')"
  ];
  String output="";
  List<FileEditor> files1= [];
  @override
  void initState() {
    super.initState();
    // example of a easier way to write code instead of writing it in a single string


    // The files displayed in the navigation bar of the editor.
    // You are not limited.
    // By default, [name] = "file.${language ?? 'txt'}", [language] = "text" and [code] = "",
    List<FileEditor> files = [
      FileEditor(
        name: "file1.py",
        language: "python",
        code: content.join("\n"), // [code] needs a string
      ),
      FileEditor(
        name: "file2.py",
        language: "python",
        code: "print('Hello, World!')",
        readonly: true, // this file won't be editable
      ),
      FileEditor(
        name: "file3.py",
        language: "python",
        code: "print('Hello, Worldddddd!')",
      ),
    ];

    model = EditorModel(

      files: files, // the files created above
      // you can customize the editor as you want
      styleOptions: EditorModelStyleOptions(
        heightOfContainer: 450,
        showUndoRedoButtons: true,
        reverseEditAndUndoRedoButtons: true,
      )..defineEditButtonPosition(
        bottom: 10,
        left: 15,
      ),
    );
    files1=files;
  }
  void  run () async {
    debugPrint(files1[0].code.toString()+"sfsadfdafsdf");
    final dio = Dio();
    final response = await dio.post(
        'https://1f49-14-139-125-227.ngrok-free.app/runcode',
        data: {
          "code": files1[0].code.toString(),
          "userId": FirebaseAuth.instance.currentUser!.uid.toString(),
        }
    );
    debugPrint(response.data.toString());
    setState(() {
      output = response.data['stdout'].toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fibonacci series")),
      // /!\ The SingleChildScrollView is important because of the phone's keypad which causes a "RenderFlex overflowed by x pixels on the bottom" error
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              height: 1000,
              child: Markdown(
                //remove scroll
                physics: const NeverScrollableScrollPhysics(),
                data: """## The Amazing Fibonacci Rabbits! 🐰🐰

Imagine a magical land where rabbits hop around and multiply super fast! These aren't just any bunnies, they follow a special pattern called the **Fibonacci sequence**. Let's hop into their world with a little Python magic! 🐇✨

**Fibonacci's Rules:**

1. We start with a baby bunny pair (1 pair).
2. Each pair takes one month to grow up.
3. Once grown, each pair produces a new baby pair every month.
4. Bunnies never... well, let's just say they live forever!

**What's Happening?**

1. **`fibonacci(n)`**: This is our magic function! It takes the number of months (`n`) and tells us how many rabbit pairs we have.
2. **Base Cases:** If `n` is 0 or 1, we simply return that number because we start with 1 pair and have 1 adult pair after the first month.
3. **Recursive Magic:** For any other month, the number of pairs is the sum of the pairs in the previous two months (adult pairs + new baby pairs). So, we call the `fibonacci` function itself with `n-1` and `n-2` and add the results!

**Run the code and see how the bunny population explodes!** 💥🐰  You can change `num_months` to explore different months.

**Bonus Round:**

*   Try printing each month's rabbit count to see the sequence grow.
*   Can you modify the code to calculate the number of rabbits instead of pairs?
*   Think about how this sequence appears in nature and art! 🌻🐚

**Remember, the Fibonacci sequence isn't just about bunnies, it's a mathematical wonder found all around us!**  Keep exploring and have fun! 🌎✨
"""
              ),
            ),
            CodeEditor(

              disableNavigationbar: true,
              model: model,
              formatters: const ["python"],
            ),

            ElevatedButton(
              onPressed: () {
                run();
              },
              child: const Text("Run"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Output:'),
        Text(output,
          style: TextStyle(
              fontSize: 20
          ),
        ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}