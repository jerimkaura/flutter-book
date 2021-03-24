// To parse this JSON data, do
// final user = userFromJson(jsonString);

import 'dart:convert';

//the created user class
class User {
  String login;
  String avatarUrl;
  String location;

  //class constructor
  User({
    this.login,
    this.avatarUrl,
    this.location,
  });

  //JSON serialization
  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "avatar_url": avatarUrl,
        "location": location,
      };
}
