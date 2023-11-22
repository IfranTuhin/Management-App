class CoachingPanelModel {
  String? memberId;
  String? memberName;
  String? memberPosition;
  String? memberDept;
  String? memberNumber;

  CoachingPanelModel({
    this.memberId,
    this.memberName,
    this.memberPosition,
    this.memberDept,
    this.memberNumber,
  });

  CoachingPanelModel.fromJson(Map map) {
    memberId = map["memberId"];
    memberName = map["memberName"];
    memberPosition = map["memberPosition"];
    memberDept = map["memberDept"];
    memberNumber = map["memberNumber"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'memberId': memberId,
      "memberName": memberName,
      'memberPosition': memberPosition,
      'memberDept': memberDept,
      "memberNumber": memberNumber,
    };
    return map;
  }
}
