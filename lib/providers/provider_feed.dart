import 'package:gatezero_demo/core/UI/shared/mock_lists.dart';
import 'package:gatezero_demo/features/features_main/data/models/model_comment.dart';
import 'package:flutter/material.dart';

import '../features/features_main/data/models/model_post.dart';
import '../features/features_main/data/models/model_story.dart';

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
