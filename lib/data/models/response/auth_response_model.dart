import 'dart:convert';

class AuthResponseModel {
  final String jwtToken;
  final User user;

  AuthResponseModel({
    required this.jwtToken,
    required this.user,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        jwtToken: json["jwt-token"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "jwt-token": jwtToken,
        "user": user.toMap(),
      };
}

class User {
  final int id;
  final String email;
  final String name;
  final String roles;
  final String profileImage;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.roles,
    required this.profileImage
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        roles: json["roles"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "name": name,
        "roles": roles,
        "profile_image": profileImage,
      };
}
