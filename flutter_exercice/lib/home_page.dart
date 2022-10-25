// ignore_for_file: prefer_const_constructors


import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_exercice/second_page.dart';



import 'person.dart';

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
  List listOfGame = [];
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _adress = TextEditingController();
  List people = [
    Person(firstName: 'John', lastName: 'John', adress: '123 Main St'),
    Person(firstName: 'Jane', lastName: 'Paul', adress: '456 Main St'),
    Person(firstName: 'Michel', lastName: 'Oka', adress: '789 Main St'),
    Person(firstName: 'Sara', lastName: 'James', adress: '101 Main St'),
  ];

  void showGrid() async {
    // final prefs = await SharedPreferences.getInstance();
    // final gameList = json.decode(prefs.getString('game')!);
    // setState(() {
    //   listOfGame = gameList;
    // });
    // print(gameList);
  }

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
    final person = Person(
        firstName: _firstName.text,
        lastName: _lastName.text,
        adress: _adress.text);
    setState(() {
      if (_firstName.text != '' && _lastName.text != '' && _adress.text != '') {
        listOfpeople.add(person);
        _firstName.text = '';
        _lastName.text = '';
        _adress.text = '';
        Navigator.of(context).pop();
      }
    });
  }

  Future<void> _navigationAndDisplayForms(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecondPage()),
    );
    if (!mounted) return;
    setState(() {
      listOfGame.add(result);
    });
  }
//open a dialog to add a new person
  // void createNewPerson() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //             content: SizedBox(
  //           height: 250,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               TextField(
  //                 controller: _firstName,
  //                 decoration: InputDecoration(
  //                   contentPadding: EdgeInsets.all(10),
  //                   labelText: 'first name',
  //                 ),
  //               ),
  //               TextField(
  //                 controller: _lastName,
  //                 decoration: InputDecoration(
  //                   contentPadding: EdgeInsets.all(10),
  //                   labelText: 'last name',
  //                 ),
  //               ),
  //               TextField(
  //                 controller: _adress,
  //                 decoration: InputDecoration(
  //                   contentPadding: EdgeInsets.all(10),
  //                   labelText: 'adress',
  //                 ),
  //               ),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   addNewPerson();
  //                 },
  //                 child: const Text('Add'),
  //               )
  //             ],
  //           ),
  //         ));
  //       });
  // }

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
          itemCount: listOfGame.length,
          itemBuilder: (context, index) {
            return Card(
                child: Column(
              children: [
                ListTile(
                  tileColor:
                      colors.length > index ? colors[index] : Colors.grey,
                  leading: Icon(Icons.person),
                  title: Text(listOfGame[index].gameName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text(listOfGame[index].gameType),
                ),
                ListTile(
                  tileColor:
                      colors2.length > index ? colors2[index] : Colors.white,
                  leading: Icon(Icons.flag),
                  title: Text(listOfGame[index].year,
                      style: TextStyle(decoration: TextDecoration.underline)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deletePerson(listOfGame[index]);
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
              heroTag: 'btn1',
              onPressed: () {
                _navigationAndDisplayForms(context);
              },
              tooltip: 'Adding a new person',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: 'btn2',
              onPressed: showGrid,
              tooltip: 'Random person',
              child: const Icon(Icons.person),
            ),
          ],
        ));
  }
}
