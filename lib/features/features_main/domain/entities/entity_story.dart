import 'dart:typed_data';

class StoryEntity {
  final String publisherID;
  String publisherName;
  final String shareTime;
  final Uint8List image;
  String thumbNailImage;

  StoryEntity({this.publisherID = "", this.publisherName = "", this.shareTime = "", this.image, this.thumbNailImage = ""});
}
