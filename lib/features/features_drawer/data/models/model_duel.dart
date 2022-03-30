class DuelModel {
  final String id;
  final String inviteTime;
  final String acceptTime;
  final String deadLine;
  final String inviterID;
  final String invitedID;
  final int inviterRecycled;
  final int invitedRecycled;
  final bool inviterStatus;
  final bool invitedStatus;

  DuelModel({
    this.id = '',
    this.inviteTime = '',
    this.acceptTime = '',
    this.inviterID = '',
    this.invitedID = '',
    this.deadLine = '',
    this.inviterRecycled = 0,
    this.invitedRecycled = 0,
    this.inviterStatus = false,
    this.invitedStatus = false,
  });

  factory DuelModel.fromJSON(Map<String, dynamic> json) {
    return DuelModel(
      id: json.containsKey("id") ? json["id"] : "",
      inviteTime: json.containsKey("inviteTime") ? json["inviteTime"] ?? '' : "",
      acceptTime: json.containsKey("acceptTime") ? json["acceptTime"] ?? '' : "",
      inviterID: json.containsKey("inviterID") ? json["inviterID"] ?? '' : "",
      invitedID: json.containsKey("invitedID") ? json["invitedID"] ?? '' : "",
      deadLine: json.containsKey("deadLine") ? json["deadLine"] ?? '' : "",
      inviterRecycled: json.containsKey("inviterRecycled") ? json["inviterRecycled"] ?? 0 : 0,
      invitedRecycled: json.containsKey("invitedRecycled") ? json["invitedRecycled"] ?? 0 : 0,
      inviterStatus: json.containsKey("inviterStatus") ? json["inviterStatus"] ?? false : false,
      invitedStatus: json.containsKey("invitedStatus") ? json["invitedStatus"] ?? false : false,
    );
  }

  Map<String, dynamic> toJSON() => {
        "id": id,
        "inviteTime": inviteTime,
        "acceptTime": acceptTime,
        "inviterID": inviterID,
        "invitedID": invitedID,
        "deadLine": deadLine,
        "inviterRecycled": inviterRecycled,
        "invitedRecycled": invitedRecycled,
        "inviterStatus": inviterStatus,
        "invitedStatus": invitedStatus,
      };
}
