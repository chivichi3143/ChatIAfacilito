import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String sendEmail;
  final String resEmail;
  final String? message;
  final Timestamp? timestamp;

  UserModel({
    required this.uid,
    required this.sendEmail,
    required this.resEmail,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'sendEmail': sendEmail,
      'resEmail': resEmail,
      'message': message,
      'timestamp': timestamp,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map['uid'],
        sendEmail: map['sendEmail'],
        resEmail: map['resEmail'],
        message: map['message'],
        timestamp: map['timestamp']);
  }
}
