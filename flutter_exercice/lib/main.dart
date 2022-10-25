// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_exercice/home_page.dart';
import 'package:flutter_exercice/second_page.dart';

import 'mongodb.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {SecondPage.tag: (context) => SecondPage()},
      title: 'Flutter Exercice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
