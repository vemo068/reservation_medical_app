class HourLabel {
  final int? id;
  final String label;
  HourLabel({this.id,required this.label});

  static fromJson(Map<String, dynamic> json){
    return HourLabel(id:json["labelId"] ,label:json["label"] );
  }
}
