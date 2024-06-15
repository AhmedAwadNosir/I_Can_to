import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ican_to/core/utils/constans.dart';

Future<void> updateUserProfileData(Map<String, dynamic> updatedData) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  await firestore
      .collection(colectionUsers)
      .doc(auth.currentUser!.uid)
      .update(updatedData);
}
