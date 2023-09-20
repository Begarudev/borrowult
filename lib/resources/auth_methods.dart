import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:borrowult/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null && isEmailAllowed("${user.email}")) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
            'email': user.email,
          });
        }
        res = true;
      } else {
        // Email condition not met, so delete data, sign out, and display an error
        await _firestore.collection('users').doc(user?.uid).delete();
        await _auth.signOut();
        showSnackBar(context, 'Domain not allowed');
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      res = false;
    }
    return res;
  }

  // Add this method to fetch the profile picture URL from Firestore
  Future<String?> getProfilePictureUrl(String userId) async {
    try {
      final DocumentSnapshot userSnapshot =
          await _firestore.collection('users').doc(userId).get();
      if (userSnapshot.exists) {
        final data = userSnapshot.data() as Map<String, dynamic>;
        final profilePictureUrl = data['profilePhoto'] as String?;
        return profilePictureUrl;
      }
    } catch (error) {
      print('Error fetching profile picture URL: $error');
    }
    return null;
  }

  void signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}

bool isEmailAllowed(String email) {
  // Check if the email ends with "@pilani.bits-pilani.ac.in"
  if (email.toLowerCase().endsWith("@pilani.bits-pilani.ac.in")) {
    return true;
  }
  return false;
}
