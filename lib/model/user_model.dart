import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userName;
  final String userEmail;
  final String userUid;

  UserModel(
      {required this.userName, required this.userEmail, required this.userUid});

  factory UserModel.fromDatabase(DocumentSnapshot snapshot) {
    return UserModel(
      userName: snapshot['name'],
      userEmail: snapshot['email'],
      userUid: snapshot['uid'],
    );
  }
}
