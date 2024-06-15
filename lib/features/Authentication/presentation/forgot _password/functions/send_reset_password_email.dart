import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ican_to/features/Authentication/presentation/forgot%20_password/views/check_emial_view.dart';

Future sendResetPasswordEmail(
    {required BuildContext context, required String email}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    Navigator.pushNamed(context, CheckEmialView.id);
  } on FirebaseAuthException catch (e) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      },
    );
  } catch (e) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(e.toString()),
        );
      },
    );
  }
}
