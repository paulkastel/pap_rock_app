import 'dart:math';

/// Enum for player sex to choose
enum PlayerSex { Male, Female }

///Class that represents user. His name, sex, score etc.
class Player {
  Player(String userName, PlayerSex userSex) {
    _name = userName;
    playerSex = userSex;
  }

  static final List<String> _partNameBegin = [
    "Ar",
    "Nei",
    "Korn",
    "Go",
    "Zer",
    "Fod",
    "Kas",
    "Pr",
    "Wed",
    "Mod",
    "Hei",
    "Bof",
    "Cu",
    "Ci",
    "Zy"
  ];
  static final List<String> _partNameMiddle = [
    "og",
    "bra",
    "n",
    "o",
    "roj",
    "asa",
    "zz",
    "hon",
    "u",
    "ij",
    "des",
    "yh",
    "du",
    "kh"
  ];
  static final List<String> _partNameEnd = [
    "nig",
    "ing",
    "x",
    "a",
    "r",
    "op",
    "s",
    "c",
    "ag",
    "sin",
    "me",
    "us"
  ];

  String _name;

  String get playerName => _name;
  set playerName(String name) {
    if (name.length >= 5 && name != null) {
      _name = name;
    }
  }

  static String generateRandomPlayerName() {
    Random generator = new Random();
    return _partNameBegin[generator.nextInt(_partNameBegin.length)] +
        _partNameMiddle[generator.nextInt(_partNameMiddle.length)] +
        _partNameEnd[generator.nextInt(_partNameEnd.length)];
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
