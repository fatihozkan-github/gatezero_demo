import 'package:flutter/material.dart';
import 'package:gatezero_demo/UI/design_materials/mock_lists.dart';
import 'package:gatezero_demo/models/model_comment.dart';
import 'package:http/http.dart';

import '../models/model_post.dart';
import '../models/model_story.dart';

class FeedProvider extends ChangeNotifier {
  List<PostModel> postList = Mocks.mockPostList;
  List<StoryModel> storyList = Mocks.mockStoryList;

  addStory(StoryModel storyData) {
    storyList.add(storyData);
    notifyListeners();
  }

  addPost(PostModel postData) {
    postList.add(postData);
    notifyListeners();
  }

  addComment({PostModel postModel, CommentModel commentModel}) {
    int x = postList.indexOf(postModel);
    postList[x].comments.addAll({"${commentModel.timeStamp}": commentModel});
    notifyListeners();
  }

  removeComment({PostModel postModel, CommentModel commentModel}) {
    int x = postList.indexOf(postModel);
    postList[x].comments.removeWhere((key, value) => value == commentModel);
    notifyListeners();
  }
}
