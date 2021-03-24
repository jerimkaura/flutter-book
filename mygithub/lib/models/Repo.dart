// To parse this JSON data, do
//
//     final repository = repositoryFromJson(jsonString);

import 'dart:convert';

class Repository {
  Repository({
    this.id,
    this.name,
    this.owner,
    this.description,
    this.createdAt,
    this.defaultBranch,
  });

  int id;
  String name;
  Owner owner;
  String description;
  DateTime createdAt;
  String defaultBranch;

  factory Repository.fromRawJson(String str) => Repository.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Repository.fromJson(Map<String, dynamic> json) => Repository(
        id: json["id"],
        name: json["name"],
        owner: Owner.fromJson(json["owner"]),
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        defaultBranch: json["default_branch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "owner": owner.toJson(),
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "default_branch": defaultBranch,
      };
}

class Owner {
  Owner({
    this.login,
    this.id,
    this.avatarUrl,
    this.siteAdmin,
  });

  String login;
  int id;
  String avatarUrl;
  bool siteAdmin;

  factory Owner.fromRawJson(String str) => Owner.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"],
        id: json["id"],
        avatarUrl: json["avatar_url"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "avatar_url": avatarUrl,
        "site_admin": siteAdmin,
      };
}
