import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/authentification/page_connexion.dart';
import 'package:flutter_application_1/screen/pageAcceuil.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  signWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  //user connecté
  Future<User?> get user async {
    final user = FirebaseAuth.instance.currentUser;
    return user;
  }

// connecxion of user by email and password
  Future signup(String email, String password) async {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: ((context) => Center(
    //           child: CircularProgressIndicator(),
    //         )));
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // if (result.user != null) {
      //   return true;
      // } else {
      //   return false;
      // }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    // navigatorKey.currentState.popUntil
  }

  Future signin(String email, String password) async {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: ((context) => Center(child: CircularProgressIndicator())));
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    // navigatorKey.currentState.popUntil((route)=>route.isFirst)
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

//determine if user is authenticated
  handleAuthState() {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const pageAcceuil();
          } else {
            return page_connexion();
          }
        });
  }
}
