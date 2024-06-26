import 'package:flutter/material.dart';

import 'physics_page.dart';

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
        title: const Text('Science Home'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PhysicsPage()));
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
                      'assets/physics.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  title: Text(
                    'Physics',
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const LanguagePage()));
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
                      'assets/chemistry.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  title: Text(
                    'Chemistry',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
