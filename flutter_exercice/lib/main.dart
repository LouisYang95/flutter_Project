// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

import 'person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercice',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List listOfpeople = [];
  final _myController = TextEditingController();
  final _myController2 = TextEditingController();
  List people = [
    Person(name: 'John', adress: '123 Main St'),
    Person(name: 'Jane', adress: '456 Main St'),
    Person(name: 'Michel', adress: '789 Main St'),
    Person(name: 'Sara', adress: '101 Main St'),
  ];

  List colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
  ];
  List colors2 = [
    Colors.purple,
    Colors.pink,
    Colors.orange,
    Colors.brown,
  ];

//function to get a random person from our List
  void randomPeople() {
    final random = Random();
    final index = random.nextInt(people.length);
    final person = people[index];
    setState(() {
      listOfpeople.add(person);
    });
  }

//function to add a new person in the list
  void addNewPerson() {
    final person =
        Person(name: _myController.text, adress: _myController2.text);
    setState(() {
      if (_myController.text != '' && _myController2.text != '') {
        listOfpeople.add(person);
        _myController.text = '';
        _myController2.text = '';
        Navigator.of(context).pop();
      }
    });
  }

//open a dialog to add a new person
  void createNewPerson() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: _myController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: _myController2,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Adress',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    addNewPerson();
                  },
                  child: const Text('Add'),
                )
              ],
            ),
          ));
        });
  }

//delete person from list
  deletePerson(index) {
    setState(() {
      listOfpeople.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: listOfpeople.length,
          itemBuilder: (context, index) {
            return Card(
                child: Column(
              children: [
                ListTile(
                  tileColor:
                      colors.length > index ? colors[index] : Colors.grey,
                  leading: Icon(Icons.person),
                  title: Text(listOfpeople[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                ListTile(
                  tileColor:
                      colors2.length > index ? colors2[index] : Colors.white,
                  leading: Icon(Icons.flag),
                  title: Text(listOfpeople[index].adress,
                      style: TextStyle(decoration: TextDecoration.underline)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deletePerson(listOfpeople[index]);
                    },
                  ),
                ),
              ],
            ));
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: createNewPerson,
              tooltip: 'Adding a new person',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: randomPeople,
              tooltip: 'Random person',
              child: const Icon(Icons.person),
            ),
          ],
        ));
  }
}
