import 'package:flutter/material.dart';
import 'package:gatezero_demo/utils/utilities_enums.dart';
import 'dart:typed_data';

import '../models/model_challenge.dart';
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

class TransitionScreenArgs {
  final MachineEvent machineEvent;
  final String machineCode;
  final bool isPinField;
  TransitionScreenArgs({@required this.machineEvent, @required this.machineCode, this.isPinField = false});
}

class MachineDetailScreenArgs {
  final String company;
  final String machineCode;

  MachineDetailScreenArgs({this.company, this.machineCode});
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

class AddMachineScreenArgs {
  final String companyValue;
  AddMachineScreenArgs({this.companyValue = 'Seçilmedi'});
}

class AdminDetailScreenArgs {
  final String machineCode;
  AdminDetailScreenArgs({this.machineCode = ''});
}
