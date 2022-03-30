import 'package:gatezero_demo/core/UI/presentation/view_model_base.dart';
import 'package:provider/provider.dart';

import '../../../../providers/provider_user.dart';
import '../../data/models/training_video_history.dart';

class TrainingSetViewModel extends BaseViewModel {
  ///
}

class TrainingSetService {
  static Future<List<TrainingVideoHistory>> getUserTrainingVideoHistory() async {
    List<TrainingVideoHistory> _returnList = [];
    return _returnList;
  }

  static Future<TrainingVideoHistory> saveTrainingVideoHistory(String videoId) async {
    var data = TrainingVideoHistory(userId: "asdfgdf", completedVideo: true, completedSurvey: false, videoId: videoId);
    return data;
  }

  static Future<void> updateUserCoin(context) async {
    Provider.of<UserProvider>(context, listen: false).updateCoin(10);
  }
}
