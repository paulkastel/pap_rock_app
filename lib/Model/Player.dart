import 'dart:math';

/// Enum for player sex to choose
enum PlayerSex { Male, Female }

///Class that represents user. His name, sex, score etc.
class Player {
  Player(String userName, PlayerSex userSex) {
    _name = userName;
    playerSex = userSex;
  }

  String _name;

  String get playerName => _name;
  set playerName(String name) {
    if (name.length >= 5) {
      _name = name;
    }
  }

  static String generateRandomPlayerName() {
    Random generator = new Random();
    if (generator.nextBool())
      return "NameE";
    else
      return "PlaerSex";
  }

  static PlayerSex generateRandomPlayerSex() {
    Random generator = new Random();
    if (generator.nextBool())
      return PlayerSex.Male;
    else
      return PlayerSex.Female;
  }

  PlayerSex playerSex;
}
