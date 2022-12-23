class HabitDetailModel {
  HabitDetailModel({
    this.commentNum = 0,
    this.habitDesc = "",
    this.habitId = 0,
    this.habitName = "",
    this.imgUrlList = const [],
  });

  HabitDetailModel.fromJson(dynamic json) {
    commentNum = json['commentNum'] ?? 0;
    habitDesc = json['habitDesc'] ?? "";
    habitId = json['habitId'] ?? 0;
    habitName = json['habitName'] ?? "";
    imgUrlList = json['imgUrlList'] != null ? json['imgUrlList'].cast<String>() : [];
  }

  int commentNum = 0;
  String habitDesc = "";
  int habitId = 0;
  String habitName = "";
  List<String> imgUrlList = [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['commentNum'] = commentNum;
    map['habitDesc'] = habitDesc;
    map['habitId'] = habitId;
    map['habitName'] = habitName;
    map['imgUrlList'] = imgUrlList;
    return map;
  }
}
