import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'india_history_quiz_page.dart';

class IndianHistoryPage extends StatefulWidget {
  const IndianHistoryPage({super.key});

  @override
  State<IndianHistoryPage> createState() => _IndianHistoryPageState();
}

class _IndianHistoryPageState extends State<IndianHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indian History'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 16.0),
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('assets/india.png'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Indian History',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text("""
1. Indus Valley Civilization (3300 BCE - 1300 BCE):
Flourished in the Indus and Ghaggar-Hakra river basins (modern-day Pakistan and northwest India).
Renowned for well-planned cities like Mohenjo-daro and Harappa.
Advanced for their time in agriculture, drainage systems, and crafts (pottery, metalworking).
The script they used remains undeciphered, leaving much about their society a mystery.

2. Mauryan Empire (322 BCE - 185 BCE):
Founded by Chandragupta Maurya, considered one of the greatest rulers in history.
The empire stretched across much of the Indian subcontinent, promoting unity and stability.
Emperor Ashoka, Chandragupta's grandson, embraced Buddhism after witnessing the horrors of war and spread its message of non-violence.
The empire's infrastructure and administration were highly developed.

3. Mughal Empire (1526 CE - 1857 CE):
Founded by Babur, a descendant of Genghis Khan, who laid the foundation in the north.
Mughal emperors like Akbar the Great were known for religious tolerance and cultural integration.
The empire produced magnificent art, architecture (Taj Mahal), and literature.
The later Mughal period saw decline due to internal conflicts and external pressures.

4. Chola Empire (3rd century BCE - 13th century CE):
A South Indian power centered in Tamil Nadu, known for its maritime prowess.
Cholas dominated trade with Southeast Asia and beyond.
They built grand temples showcasing intricate craftsmanship.
Rajaraja Chola I and Rajendra Chola I were notable emperors who expanded the empire's influence.

5. Indian Independence (1947):
After centuries of British rule, India gained independence in 1947.
The freedom struggle was led by Mahatma Gandhi, who championed non-violent resistance.
The partition of India led to the creation of Pakistan, causing mass displacement and violence.
Despite challenges, India emerged as a free nation, embarking on a journey of democracy and development.        
""")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const IndianHistoryQuizPage(),
            ),
          );
        },
        icon: const Icon(Icons.quiz),
        label: const Text('Take Quiz'),
      )
    );
  }
}
