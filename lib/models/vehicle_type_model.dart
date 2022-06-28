class VehicleType {
  int? classId;
  String? name;
  int? seats;
  String? icon;

  VehicleType({this.classId, this.name, this.seats, this.icon});

  VehicleType.fromJson(Map<String, dynamic> json) {
    classId = json['class_id'];
    name = json['name'];
    seats = json['seats'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class_id'] = this.classId;
    data['name'] = this.name;
    data['seats'] = this.seats;
    data['icon'] = this.icon;
    return data;
  }
}
