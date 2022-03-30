class FriendModel {
  String id;
  String name;
  String superhero;
  String avatar;
  int coins;
  int level;
  int recycled;
  Map challenges;

  /// • We use [FriendModel] for general uses, not only for friend related services.
  ///
  /// • General uses: Leaderboard, challenges, friends, posts...
  FriendModel({
    this.id = '',
    this.name = '',
    this.superhero = '',
    this.avatar = '',
    this.coins = 0,
    this.level = 0,
    this.recycled = 0,
    this.challenges = const {},
  });

  factory FriendModel.fromJSON(Map<String, dynamic> json) {
    return FriendModel(
      id: json.containsKey("uID") ? json["uID"] ?? "" : "",
      name: json.containsKey("name") ? json["name"] ?? "" : "",
      superhero: json.containsKey("superhero") ? json["superhero"] ?? "" : "",
      avatar: json.containsKey("avatar") ? json["avatar"] ?? "" : "",
      coins: json.containsKey("coins") ? json["coins"] ?? 0 : 0,
      level: json.containsKey("level") ? json["level"] ?? 0 : 0,
      recycled: json.containsKey("recycled") ? json["recycled"] ?? 0 : 0,
      challenges: json.containsKey("challenges") ? json["challenges"] ?? {} : {},
    );
  }
}
