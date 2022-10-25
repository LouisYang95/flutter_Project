import 'package:flutter/material.dart';

import 'game.dart';

class SecondPage extends StatefulWidget {
  static const tag = "second_page";

  const SecondPage({super.key});
  @override
  State<StatefulWidget> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<SecondPage> {
  final _gameName = TextEditingController();
  final _gameType = TextEditingController();
  final _year = TextEditingController();

  Future<void> addNewGame(BuildContext context) async {
    final game = Game(
        gameName: _gameName.text, gameType: _gameType.text, year: _year.text);
    Navigator.pop(context, game);
    // final prefs = await SharedPreferences.getInstance();
    // final gameList = prefs.setString('game', json.encode(game));
    // print(gameList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
        ),
        body: Center(
          child: SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Game Name"),
                TextField(
                  controller: _gameName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Game Name',
                  ),
                ),
                const Text("Game Type"),
                TextField(
                  controller: _gameType,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Game Type',
                  ),
                ),
                const Text("Year"),
                TextField(
                  controller: _year,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Year',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        addNewGame(context);
                      },
                      child: const Text('Add'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Go back"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
