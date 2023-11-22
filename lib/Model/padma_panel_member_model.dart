class PadmaPanelMemberModel {
  String? memberId;
  String? memberName;
  String? memberPosition;
  String? memberDept;
  String? memberNumber;

  PadmaPanelMemberModel({
    this.memberId,
    this.memberName,
    this.memberPosition,
    this.memberDept,
    this.memberNumber,
  });

  PadmaPanelMemberModel.fromJson(Map map) {
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
