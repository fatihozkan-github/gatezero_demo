class TrainingVideoHistory {
  final String userId;
  final String videoId;
  final bool completedVideo;
  final bool completedSurvey;

  TrainingVideoHistory({
    this.userId,
    this.completedVideo,
    this.completedSurvey,
    this.videoId,
  });

  factory TrainingVideoHistory.fromJson(Map<String, dynamic> json) {
    return TrainingVideoHistory(
      userId: json['userId'],
      completedVideo: json['completedVideo'],
      completedSurvey: json['completedSurvey'],
      videoId: json['videoId'],
    );
  }

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'completedVideo': completedVideo,
        'completedSurvey': completedSurvey,
        'videoId': videoId,
      };
}
