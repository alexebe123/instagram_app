import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class ApiServiceFirebase extends ChangeNotifier {
  static ApiServiceFirebase? _instance;
  late FirebaseFirestore firebaseFirestore;
  late bool isLoggedIn;
  FirebaseAuth auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  User? user;

  ApiServiceFirebase._internal() {
    firebaseFirestore = FirebaseFirestore.instance;
  }

  static ApiServiceFirebase get instance {
    _instance ??= ApiServiceFirebase._internal();
    return _instance!;
  }

  Future<bool> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      // Once signed in, return the UserCredential
      auth.signInWithCredential(facebookAuthCredential);
      getAccount();
      return true;
    } else {
      return false;
    }
  }

  User? getAccount() {
    user = auth.currentUser;
    if (user == null) {
      isLoggedIn = false;
    } else {
      isLoggedIn = true;
    }
    return user;
  }
}
