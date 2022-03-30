import 'package:flutter/material.dart';
import 'dart:typed_data';

import '../../features/features_drawer/data/models/model_challenge.dart';
import '../models/model_friend.dart';

class OtherProfileScreenArgs {
  FriendModel friendModel;
  final String friendID;
  OtherProfileScreenArgs({this.friendModel, this.friendID});
}

class InteractionScreenArgs {
  final bool shouldShowDialog;
  InteractionScreenArgs({this.shouldShowDialog});
}

class ShareStoryScreenArgs {
  final Uint8List storyImage;
  ShareStoryScreenArgs({@required this.storyImage});
}

class ChallengeDetailScreenArgs {
  final ChallengeModel challengeData;
  ChallengeDetailScreenArgs({@required this.challengeData});
}

class ChallengeShareDetailScreenArgs {
  final Uint8List imageData;
  final ChallengeModel challengeData;
  ChallengeShareDetailScreenArgs({@required this.imageData, @required this.challengeData});
}
