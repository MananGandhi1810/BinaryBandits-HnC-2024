import 'package:binary_bandits_hnc/units_measurements_page.dart';
import 'package:flutter/material.dart';

class PhysicsPage extends StatefulWidget {
  const PhysicsPage({super.key});

  @override
  State<PhysicsPage> createState() => _PhysicsPageState();
}

class _PhysicsPageState extends State<PhysicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physics'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UnitsMeasurementsPage()));
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
                    image: const AssetImage('assets/units_measurements.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  title: Text('Units and Measurements'),
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
                    image: const AssetImage('assets/laws_motion.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  title: Text('Laws of Motion'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
