import 'dart:typed_data';

class StoryModel {
  final String publisherID;
  String publisherName;
  final String shareTime;
  final Uint8List image;
  String thumbNailImage;

  StoryModel({this.publisherID = "", this.publisherName = "", this.shareTime = "", this.image, this.thumbNailImage = ""});
}
