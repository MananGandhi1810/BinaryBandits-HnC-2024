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
        title:  Text('Technology'),
      ),
      body: Column(
        children: [

          Card(
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Fibonacci()));
              },
              title: Text('Fibonacci Series'),
            ),
          ),
          Card(
            child: ListTile(

              title: Text('Armstrong Number'),

            ),
          ),

        ],
      ),
    );
  }
}
