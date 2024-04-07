import 'dart:io';

import 'package:binary_bandits_hnc/tech_fibonacci.dart';
import 'package:code_editor/code_editor.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Tech_Home extends StatefulWidget {
  const Tech_Home({super.key});

  @override
  State<Tech_Home> createState() => _Tech_HomeState();
}

class _Tech_HomeState extends State<Tech_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technology'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Fibonacci()));
            },
            child: Card(

              child: Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(

                  image:  DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                    image: AssetImage('assets/fibonacci.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(

                  title: const Text('Fibonacci Series',
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

                  image:  DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                    image: AssetImage('assets/armstrong.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(

                  title: const Text('Armstrong Number',
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
