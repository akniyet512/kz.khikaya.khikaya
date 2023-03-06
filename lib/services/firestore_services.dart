import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  Future<int> chechUserMode({required userId}) async {
    DocumentSnapshot userData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userData.get('userMode');
  }

  Future<void> createUserData({
    required userId,
    required name,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      "name": name,
      "userMode": 1,
    });
  }
}
