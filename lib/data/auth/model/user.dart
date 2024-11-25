import 'dart:convert';

import 'package:flutter_e_commerce/data/auth/entity/user.dart';
class UserModel {
  final String firstName;
  final String userId;
  final String image;
  final String email;
  final int gender;
  final String lastName;
  UserModel({
    required this.email,
    required this.image,
    required this.gender,
    required this.firstName,
    required this.lastName,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      firstName: map['firstname'] as String,
      lastName: map['lastname'] as String,
      email: map['email'] as String,
      image: map['image'] ?? '',
      gender: map['gender'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName, 
      email: email, 
      image: image, 
      gender: gender
    );
  }
}