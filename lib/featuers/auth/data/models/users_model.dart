import 'package:new_sulution_test/featuers/auth/domain/entities/users.dart';

class UserModel extends Users {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
    required super.imageUrl,
    required super.phone,
    required super.dateOfBirth,
    required super.gender,
    required super.location,
  });

  factory UserModel.fromJson({
    required Map<String, dynamic> json,
    required String userId,
  }) {
    return UserModel(
      id: userId,
      name: json['name'],
      email: json['email'],
      password: json['password'],
      imageUrl: json['imageUrl'],
      phone: json['phone'],
      dateOfBirth: json['dateOfBirth'],
      gender: json['gender'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "name": name,
      "email": email,
      "password": password,
      "imageUrl": imageUrl,
      "phone": phone,
      "dateOfBirth": dateOfBirth,
      "gender": gender,
      "location": location,
    };
    return json;
  }
}
