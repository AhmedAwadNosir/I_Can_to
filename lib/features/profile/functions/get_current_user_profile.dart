import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ican_to/core/utils/constans.dart';
import 'package:ican_to/features/Authentication/data/Models/user_data_model.dart';

Future<UserModel> getCurrentUserProfileData() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  UserModel userModel;
  if (auth.currentUser!.email == null) {
    QuerySnapshot qurySnapShot = await firestore
        .collection(colectionUsers)
        .where('email', isEqualTo: auth.currentUser!.phoneNumber)
        .get();
    final json = qurySnapShot.docs[0].data() as Map<String, dynamic>;
    userModel = UserModel.fromjson(json);
  } else {
    QuerySnapshot qurySnapShot = await firestore
        .collection(colectionUsers)
        .where('email', isEqualTo: auth.currentUser!.email)
        .get();
    final json = qurySnapShot.docs[0].data() as Map<String, dynamic>;
    userModel = UserModel.fromjson(json);
  }
  log(userModel.country!);
  return userModel;
}
