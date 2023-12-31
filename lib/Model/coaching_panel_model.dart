class CoachingPanelModel {
  String? memberId;
  String? memberName;
  String? memberPosition;
  String? memberDept;
  String? memberNumber;
  String? imageUrl;

  CoachingPanelModel({
    this.memberId,
    this.memberName,
    this.memberPosition,
    this.memberDept,
    this.memberNumber,
    this.imageUrl,
  });

  CoachingPanelModel.fromJson(Map map) {
    memberId = map["memberId"];
    memberName = map["memberName"];
    memberPosition = map["memberPosition"];
    memberDept = map["memberDept"];
    memberNumber = map["memberNumber"];
    imageUrl = map["imageUrl"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'memberId': memberId,
      "memberName": memberName,
      'memberPosition': memberPosition,
      'memberDept': memberDept,
      "memberNumber": memberNumber,
      "imageUrl": imageUrl,
    };
    return map;
  }

  Map<String, dynamic> toImage() {
    Map<String, dynamic> map = {
      "imageUrl": imageUrl,
    };
    return map;
  }

}
