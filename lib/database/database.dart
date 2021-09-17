import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future saveUserInformation(Map<String, dynamic> userInfo, String id) async {
    return _firestore.collection('users').doc(id);
  }
}
