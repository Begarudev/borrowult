import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:borrowult/utils/utils.dart';

class GoogleSignInService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled sign-in
      } else {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        if (user != null) {
          final email = user.email;

          if (email != null && email.endsWith("@pilani.bits-pilani.ac.in")) {
            print("Successfully signed in as: ${user.displayName}");
            if (authResult.additionalUserInfo!.isNewUser) {
              await _firestore.collection('users').doc(user.uid).set({
                'username': user.displayName,
                'uid': user.uid,
                'profilePhoto': user.photoURL,
                'email': user.email,
              });
            }
            res = true;
          } else {
          // Email condition not met, so sign out and display an error
          await _auth.signOut();
          await _googleSignIn.signOut();
          print("Login with an email from this domain is not allowed");
          showSnackBar(context, 'Domain not allowed');
        }
        } 
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
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
      await _auth.signOut();
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
