import '../../../../core/models/model_friend.dart';

class CommentModel {
  final String uID;
  final String commentID;
  final String comment;
  final String timeStamp;
  final FriendModel author;
  CommentModel({this.uID = '', this.comment = '', this.timeStamp = '', this.commentID = '', this.author});

  factory CommentModel.fromJSON(Map<String, dynamic> json) {
    return CommentModel(
      uID: json.containsKey("uID") ? json["uID"] ?? "" : "",
      comment: json.containsKey("comment") ? json["comment"] ?? "" : "",
      timeStamp: json.containsKey("timeStamp") ? json["timeStamp"] ?? "" : "",
      commentID: json.containsKey("commentID") ? json["commentID"] ?? "" : "",
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      "uID": uID ?? '',
      "comment": comment ?? '',
      "timeStamp": timeStamp ?? '',
      "commentID": commentID ?? '',
    };
  }
}
