import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ican_to/core/utils/constans.dart';

Future<String> fetchUserName() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String username = "";
  if (auth.currentUser != null) {
    var snapshot = await firestore
        .collection(colectionUsers)
        .doc(auth.currentUser!.uid)
        .get();
    var userData = snapshot.data();
    username = userData?["userName"] ?? "";
  }
  log(username);
  return username;
}
