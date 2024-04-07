import 'package:flutter/material.dart';

class IndianHistoryQuizPage extends StatefulWidget {
  const IndianHistoryQuizPage({super.key});

  @override
  State<IndianHistoryQuizPage> createState() => _IndianHistoryQuizPageState();
}

class _IndianHistoryQuizPageState extends State<IndianHistoryQuizPage> {
  List<String> correctEvents = [
    'Indus Valley Civilization',
    'Maurya Empire',
    'Gupta Empire',
    'Mughal Empire',
    'British Rule',
    'Independence',
  ];
  late List<String> randomEvents;

  @override
  void initState() {
    randomEvents = List<String>.from(correctEvents)..shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indian History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Arrange the following events in chronological order',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ReorderableListView(
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final String item = randomEvents.removeAt(oldIndex);
                        randomEvents.insert(newIndex, item);
                      });
                    },
                    children: randomEvents
                        .map(
                          (event) => Card(
                            key: ValueKey(event),
                            child: ListTile(
                              key: ValueKey(event),
                              title: Text(event),
                              leading: const Icon(Icons.drag_handle),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (List<String>.from(randomEvents).join() ==
                      List<String>.from(correctEvents).join()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Congratulations!'),
                          content: const Text('You got it right!'),
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
                          title: const Text('Try again!'),
                          content: const Text('The order is incorrect.'),
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
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
