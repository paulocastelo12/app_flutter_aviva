class DiscipleModel {
  String sId;
  String name;
  String phone;
  String gender;
  String ageGroup;
  String district;
  String street;
  String number;
  String createdAt;

  DiscipleModel(
      {this.sId,
      this.name,
      this.phone,
      this.gender,
      this.ageGroup,
      this.district,
      this.street,
      this.number,
      this.createdAt});

  DiscipleModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    ageGroup = json['age_group'];
    district = json['district'];
    street = json['street'];
    number = json['number'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['phone'] = phone;
    data['gender'] = gender;
    data['age_group'] = ageGroup;
    data['district'] = district;
    data['street'] = street;
    data['number'] = number;
    data['createdAt'] = createdAt;
    return data;
  }
}
