class Game {
  String gameName;
  String gameType;
  String? year;

  String get name {
    return gameName;
  }

  set name(String name) {
    gameName = name;
  }

  String get type {
    return gameType;
  }

  set type(String type) {
    gameType = type;
  }

  String? get yearCreated {
    return year;
  }

  set yearCreated(String? gameYear) {
    gameYear = year;
  }

  Game({required this.gameName, required this.gameType, this.year});
}
