import 'package:flutter/material.dart';

class ScienceHome extends StatefulWidget {
  const ScienceHome({super.key});

  @override
  State<ScienceHome> createState() => _ScienceHomeState();
}

class _ScienceHomeState extends State<ScienceHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Science Home'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          Card(
            child: ListTile(
              title: Text('Physics'),
              onTap: () {

              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Chemistry'),
              onTap: () {

              },
            ),
          ),
        ],
      )
    );
  }
}
