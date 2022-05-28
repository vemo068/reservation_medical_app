class Speciality {
  int? specialityId;
  // bool isSelected = false;
  final String specialityName;
  final String imgUrl;
  Speciality(
      {this.specialityId, required this.specialityName, required this.imgUrl});

  static fromJson(Map<String, dynamic> json) {
    return Speciality(
        specialityId: json["specialityId"],
        specialityName: json["specialityName"],
        imgUrl: json["imgUrl"]);
  }
}

var sps = [
  Speciality(
      specialityId: 1,
      specialityName: "specialityName",
      imgUrl: "assets/tooth.png")
];
