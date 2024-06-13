import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? userName;
  String? email;
  String? userPhoto;
  UserCredential? userCredential;
  String? gender;
  String? country;
  String? birthdate;

  UserModel(
      {this.userName,
      this.email,
      this.userPhoto,
      this.userCredential,
      this.gender,
      this.country,
      this.birthdate});

  factory UserModel.fromjson(Map<String, dynamic> json) => UserModel(
        userName: json["userName"],
        email: json["email"],
        userPhoto: json["userPhoto"],
        gender: json["gender"] ?? '',
        country: json["country"] ?? '',
        birthdate: json["birthdate"] ?? '',
      );

  Map<String, dynamic> tojson() => {
        "userName": userName ?? userCredential!.user!.displayName,
        "email": email ?? userCredential!.user!.email,
        "userPhoto": userPhoto ?? userCredential!.user!.photoURL,
        "gender": gender ?? '',
        "country": country ?? '',
        "birthdate": birthdate ?? '',
      };
}
