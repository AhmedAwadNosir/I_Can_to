import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Views/complet_and_store_user_data_view.dart';
import 'package:ican_to/features/Home/presentation/views/home_view.dart';

void navigationControler(
    BuildContext context, UserCredential credintial) async {
  User? user = FirebaseAuth.instance.currentUser;
  String uid = user!.uid;

  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('user')
      .where('doc', isEqualTo: uid)
      .get();

  if (querySnapshot.docs.isEmpty) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CompletAndStoreUserDataView(userId: uid, credential: credintial),
        ));
  } else {
    Navigator.pushReplacementNamed(context, HomeView.id);
  }
}
