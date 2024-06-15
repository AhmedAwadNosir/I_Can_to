import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/constans.dart';
import 'package:ican_to/features/Authentication/functions/show_snack_bar.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Views/complet_and_store_user_data_view.dart';
import 'package:ican_to/features/Home/views/home_view.dart';

void navigationControler(
    BuildContext context, UserCredential credintial) async {
  User? user = FirebaseAuth.instance.currentUser;
  String uid = user!.uid;

  DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection(colectionUsers)
      .doc(uid)
      .get();
  log(snapshot.exists.toString());
  if (snapshot.exists) {
    Navigator.pushReplacementNamed(context, HomeView.id);
  } else {
    showSnackBar("go to complete your data! ", context);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CompletAndStoreUserDataView(userId: uid, credential: credintial),
        ));
  }
}
