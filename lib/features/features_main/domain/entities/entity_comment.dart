import '../../../../core/models/model_friend.dart';

class CommentEntity {
  final String uID;
  final String commentID;
  final String comment;
  final String timeStamp;
  final FriendModel author;
  CommentEntity({this.uID = '', this.comment = '', this.timeStamp = '', this.commentID = '', this.author});
}
