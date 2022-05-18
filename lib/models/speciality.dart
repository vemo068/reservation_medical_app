class Specility {
  int? specialityId;
  // bool isSelected = false;
  final String specialityName;
  final String imgUrl;
  Specility(
      {this.specialityId, required this.specialityName, required this.imgUrl});

  static fromJson(Map<String, dynamic> json) {
    return Specility(
        specialityId: json["specialityId"],
        specialityName: json["specialityName"],
        imgUrl: json["imgUrl"]);
  }
}

var sps = [
  Specility(
      specialityId: 1,
      specialityName: "specialityName",
      imgUrl: "assets/tooth.png")
];
