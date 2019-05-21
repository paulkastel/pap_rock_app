
/// Enum for player sex to choose
enum PlayerSex { Male, Female }


///Class that represents user. His name, sex, score etc.
class Player {
  Player(String userName, PlayerSex userSex) {
    _name = userName;
    _sex = userSex;
  }

  String _name;
  
  String get playerName => _name;
  set playerName(String name) {
    if (name.length > 5) {
      _name = name;
    }
  }

  PlayerSex _sex;
  PlayerSex get playerSex => _sex;
}
