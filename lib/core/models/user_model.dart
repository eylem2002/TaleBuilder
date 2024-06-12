import 'package:tale/utils/shared.dart';

enum UsersRole { user, expert }

// Model class representing a UserModel
class UserModel {
  String? id;
  String? name;

  String? email;

  String? phone;
  UserModel.empty();
  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
  }) {
    id = uuid.v4();
  }

//This is a factory Constructor to create UserModel instance from JSON obj
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    phone = json['phone'];
    email = json['email'];
  }

//convert the UserModel instance to a JSON object

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    data['phone'] = phone;
    data['email'] = email;

    return data;
  }
}

//  class representing a list of Users

class UserList {
  List<UserModel> users;

  UserList({required this.users});

  factory UserList.fromJson(List<dynamic> data) {
    List<UserModel> temp = [];
    temp = data.map((item) {
      return UserModel.fromJson(Map<String, dynamic>.from(item));
    }).toList();

    return UserList(users: temp);
  }
}
