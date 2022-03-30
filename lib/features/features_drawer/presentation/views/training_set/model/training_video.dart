class TrainingVideo {
  final String youtubeId;
  final String title;
  final int durationMinutes;
  final bool hasSurvey;

  const TrainingVideo({
    this.youtubeId = '',
    this.title = '',
    this.durationMinutes = 0,
    this.hasSurvey = false,
  });

  factory TrainingVideo.fromJson(Map<String, dynamic> json) {
    return TrainingVideo(
      youtubeId: json['id'],
      title: json['title'],
      durationMinutes: json['duration'],
      hasSurvey: json['hasSurvey'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': youtubeId,
        'hasSurvey': hasSurvey,
        'title': title,
        'duration': durationMinutes,
      };
}
