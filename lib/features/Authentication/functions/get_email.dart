import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ican_to/core/utils/constans.dart';

Future<String> getEmail({required String username}) async {
  try {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection(colectionUsers)
        .where("userName", isEqualTo: username.trim())
        .get();
    String email = snapshot.docs[0]["email"];
    return email;
  } catch (e) {
    throw Exception(e.toString());
  }
}
