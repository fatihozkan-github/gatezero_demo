class ChallengeSupportModel {
  final String name;
  final String photo;
  final String timeStamp;
  final List supporters;

  ChallengeSupportModel({this.timeStamp = "", this.name = "", this.supporters = const [], this.photo = ""});

  factory ChallengeSupportModel.fromJSON(Map<String, dynamic> json) {
    return ChallengeSupportModel(
      name: json.containsKey("name") ? json["name"] ?? "" : "",
      photo: json.containsKey("photo") ? json["photo"] ?? "" : "",
      timeStamp: json.containsKey("timeStamp") ? json["timeStamp"] ?? "" : "",
      supporters: json.containsKey("supporters") ? json["supporters"] ?? [] : [],
    );
  }
}
