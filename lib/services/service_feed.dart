// class FeedService {
//   static CollectionReference _posts = FirebaseFirestore.instance.collection('posts');
//
//   static Future<List<PostModel>> fetchPosts() async {
//     List<PostModel> _postList = [];
//     try {
//       QuerySnapshot _map = await _posts.get();
//       List<QueryDocumentSnapshot> query = _map.docs;
//       query.forEach((element) => _postList.add(PostModel.fromJSON(element.data())));
//     } catch (e) {
//       print(e);
//       UIUtils.showToast(LocalizationService.texts.genericErrorLong);
//     }
//     return _postList;
//   }
//
//   static Future<bool> likeOnTap(userID, isLiked, PostModel postModel) async {
//     bool returnValue = false;
//
//     if (isLiked) {
//       await _posts.doc(postModel.id).update({
//         "likers": FieldValue.arrayRemove([userID])
//       });
//       returnValue = false;
//     } else if (!isLiked) {
//       await _posts.doc(postModel.id).update({
//         "likers": FieldValue.arrayUnion([userID])
//       });
//       returnValue = true;
//     }
//     return returnValue;
//   }
//
//   static Future addComment(PostModel postModel, CommentModel commentData) async {
//     try {
//       if (GeneralUtils.hasData(commentData.comment)) {
//         DocumentSnapshot _snapShot = await _posts.doc(postModel.id).get();
//         Map _map = _snapShot.data();
//         Map _oldList = _map["comments"];
//         _oldList[commentData.commentID] = commentData.toJSON();
//         await _posts.doc(postModel.id).update({"comments": _oldList});
//       }
//     } catch (e) {
//       print(e);
//       UIUtils.showToast(LocalizationService.texts.genericError);
//     }
//   }
//
//   static Future<void> removeComment(String postID, String commentID) async {
//     try {
//       DocumentSnapshot _snapShot = await _posts.doc(postID).get();
//       Map _map = _snapShot.data();
//       Map _oldList = _map["comments"];
//       _oldList.removeWhere((key, value) => key == commentID);
//       await _posts.doc(postID).update({"comments": _oldList});
//     } catch (e) {
//       print(e);
//       UIUtils.showToast(LocalizationService.texts.genericError);
//     }
//   }
// }
