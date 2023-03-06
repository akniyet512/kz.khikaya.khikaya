import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:khikaya/services/firestore_services.dart';

class AuthorizationServices {
  Future<void> loginUserWithEmailAndPassword({
    required email,
    required password,
    required context,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user!;
      log('User created with email: ${user.email}');
      if (user.emailVerified) {
        int userMode =
            await FirestoreServices().chechUserMode(userId: user.uid);
        log(userMode.toString());
        if (userMode == 1) {
          Navigator.of(context).pushReplacementNamed('/user-home');
          log('User entered the system as student: ${user.email}');
        } else if (userMode == 2) {
          Navigator.of(context).pushReplacementNamed('/mentor-home');
          log('User entered the system as mentor: ${user.email}');
        } else if (userMode == 3) {
          Navigator.of(context).pushReplacementNamed('/admin-home');
          log('User entered the system as admin: ${user.email}');
        }
      } else {
        await sendEmailVerification();
        Navigator.of(context).pushReplacementNamed('/verification');
        log('User not verified: ${user.email}');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> registerUserWithEmailAndPassword({
    required name,
    required email,
    required password,
    required context,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User account created successfully
      User user = userCredential.user!;
      log('User created with email: ${user.email}');
      FirestoreServices().createUserData(
        userId: user.uid,
        name: name,
      );
      await sendEmailVerification();
      Navigator.of(context).pushReplacementNamed('/verification');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
