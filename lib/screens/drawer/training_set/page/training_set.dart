import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../UI/components/rounded_list_tile.dart';
import '../../../../UI/components/we_spin.dart';
import '../model/training_video.dart';
import '../model/training_video_history.dart';
import '../service/training_set_service.dart';

class TrainingSet extends StatefulWidget {
  @override
  _TrainingSetState createState() => _TrainingSetState();
}

class _TrainingSetState extends State<TrainingSet> {
  List<TrainingVideoHistory> userVideoHistory = [];
  YoutubePlayerController _controller;
  List<TrainingVideo> allVideos = [
    TrainingVideo(
      title: "WE - HeroStation Kullanımı",
      durationMinutes: 1,
      hasSurvey: false,
      youtubeId: "s84s8iBr_Tc",
    ),
  ];
  bool isLoading;

  initialize() {
    isLoading = true;
    setState(() {});
    _controller = YoutubePlayerController(
        initialVideoId: '${allVideos.first.youtubeId}', flags: YoutubePlayerFlags(autoPlay: false, hideControls: false, mute: true));
    isLoading = false;
    setState(() {});
  }

  bool userCompletedVideoBefore(int index) {
    if (userVideoHistory.isEmpty) {
      return false;
    } else if (userVideoHistory.isNotEmpty) {
      if (userVideoHistory.map((e) => e.videoId).contains(allVideos[index].youtubeId)) {
        return true;
      } else
        return false;
    } else
      return false;
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eğitim Seti')),
      body: isLoading
          ? WESpinKit()
          : Column(
              children: [
                YoutubePlayer(
                  controller: _controller,
                  bottomActions: [],
                  onEnded: (metadata) async {
                    if (!userCompletedVideoBefore(0)) {
                      var result = await TrainingSetService.saveTrainingVideoHistory(metadata.videoId);
                      userVideoHistory.add(result);
                      await TrainingSetService.updateUserCoin(context);
                      setState(() {});
                    }
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: allVideos.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      bool _isCompleted = userCompletedVideoBefore(index);
                      return RoundedListTile(
                        onPressed: () => setState(() => _controller.load(allVideos[index].youtubeId)),
                        title: Text(allVideos[index].title, style: TextStyle(color: Colors.black, fontSize: 16)),
                        subTitle: Text('${allVideos[index].durationMinutes} dk ', style: TextStyle(color: Colors.black, fontSize: 15)),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(_isCompleted ? 'İzlendi' : 'İzlenmedi',
                                style: TextStyle(color: _isCompleted ? Colors.grey : Colors.black, fontSize: 16)),
                            SizedBox(height: 4),
                            Text('10 Coin', style: TextStyle(color: _isCompleted ? Colors.grey : Colors.black, fontSize: 15)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
