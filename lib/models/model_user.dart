import '../utils/utilities_constants.dart';

class UserModel {
  String uID;
  String name;
  String superHero;
  String city;
  String address;
  String company;
  String rfID;
  String phoneNumber;
  String avatar;
  List achievements;
  List referenced;
  List friends;
  int coins;
  int level;
  int recycled;
  num exp;
  Map trainingHistory;
  bool superAdmin;
  bool admin;

  UserModel({
    this.uID = '',
    this.name = '',
    this.superHero = '',
    this.city = '',
    this.exp = 18,
    this.coins = 0,
    this.level = 1,
    this.recycled = 0,
    this.friends = const [],
    this.company = '',
    this.address = '',
    this.achievements = const [],
    this.rfID = '',
    this.referenced = const [],
    this.phoneNumber = '',
    this.trainingHistory = const {},
    this.superAdmin = false,
    this.admin = false,
    this.avatar = '',
  });

  List<String> calculateLevel() {
    String _level = "1";
    String _remainder = "0.0";
    num _exp = exp;
    bool _settled = false;

    for (int i = 0; i < Constants.levelList.length; i++) {
      if (Constants.levelList[i] <= _exp) {
        _exp -= Constants.levelList[i];
      } else {
        if (!_settled) {
          _level = (i - 1).toString();
          _remainder = (_exp / Constants.levelList[i]).toStringAsFixed(2);
          _settled = true;
        }
      }
    }
    return [_level, _remainder];
  }

  String calculateFootPrint() => (recycled / 10.25 * 82.8 / 1000).toStringAsFixed(2);

  /// • TODO: Adjust this function.
  String calculateImpact() => (recycled / 10.25 * 82.8 / 1000).toStringAsFixed(2);
}
