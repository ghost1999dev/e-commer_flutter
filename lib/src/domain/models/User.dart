// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:untitled/src/domain/models/Role.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String email;
  int? id;
  dynamic?image;
  String lastname;
  String?password;
  String name;
  dynamic? notificationToken;
  String phone;
  List<Role>? roles;

  User({
    required this.email,
    this.id,
    this.image,
    required this.lastname,
    this.password,
    required this.name,
    this.notificationToken,
    required this.phone,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        lastname: json["lastName"],
        password: json["password"] ?? "",
        name: json["name"],
        notificationToken: json["notification_token"] ?? "",
        phone: json["phone"],
        roles: json["roles"] !=null ?List<Role>.from(json["roles"].map((x) => Role.fromJson(x))):[],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "image": image,
        "lastname": lastname,
        "name": name,
        "password": password,
        "notification_token": notificationToken,
        "phone": phone,
        "roles": roles !=null ? List<dynamic>.from(roles!.map((x) => x.toJson())): [],
      };
}
