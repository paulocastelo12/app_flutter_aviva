class UserModel {
  String sId;
  String login;
  String name;

  UserModel({this.sId, this.login, this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    login = json['login'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['login'] = login;
    data['name'] = name;
    return data;
  }
}