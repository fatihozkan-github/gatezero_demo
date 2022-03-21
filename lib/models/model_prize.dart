class PrizeModel {
  final String id;
  final String title;
  final String subTitle;
  final String photo;
  final List<dynamic> contenders;
  final int cost;

  PrizeModel({this.id = "", this.title = "", this.subTitle = "", this.photo = "", this.contenders = const [], this.cost = 0});
}
