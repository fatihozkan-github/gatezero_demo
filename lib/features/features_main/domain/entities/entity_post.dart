class PostEntity {
  final String id;
  final String publisherID;
  final String publisherAvatar;
  final String publisherName;
  final String text;
  final String photo;
  final String timeStamp;
  final Map comments;
  List likers;
  final List labels;

  PostEntity({
    this.id = '',
    this.text = '',
    this.photo = '',
    this.timeStamp = '',
    this.publisherID = '',
    this.comments = const {},
    this.publisherName,
    this.publisherAvatar,
    this.likers = const [],
    this.labels = const [],
  });
}
