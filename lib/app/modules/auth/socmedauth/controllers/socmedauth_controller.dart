import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SocmedauthController extends GetxController {
  //TODO: Implement SocmedauthController

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth facebookAuth = FacebookAuth.instance;
  final GoogleSignIn googleSignin = GoogleSignIn();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signInWithFb() async {
    final LoginResult result = await facebookAuth.login();
    if (result.accessToken?.token != null) {
      final graphResponse = await http.get(Uri.parse(
          'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${result.accessToken?.token}'));
      final profile = jsonDecode(graphResponse.body);

      if (result.status == LoginStatus.success) {
        try {
          final OAuthCredential credential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          await firebaseAuth.signInWithCredential(credential);
          Get.dialog(
            const Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
            ),
          );
          // saving the values
          checkUserExists(profile['id']).then((value) {
            if (value) {
              getUserDataFromFirestore(profile['id']);
            } else {
              saveDataToFirestore(
                profile['name'],
                profile['email'],
                profile['id'],
                profile['picture']['data']['url'],
              );
            }
          });
        } on FirebaseAuthException catch (e) {
          switch (e.code) {
            case "account-exists-with-different-credential":
              Get.snackbar('Error',
                  "You already have an account with us. Use correct provider");
              break;
            case "null":
              Get.snackbar(
                  'Error', "Some unexpected error while trying to sign in");
              break;
            default:
              Get.snackbar('Error', e.toString());
          }
        }
      } else {
        Get.snackbar('Error', "Login failed, please try again in a few second");
      }
    }
  }

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignin.signIn().catchError((onError) => print(onError));
    if (googleSignInAccount == null) {
      Get.snackbar('Error', "Login failed, please try again in a few second");
    } else {
      try {
        // proses data untuk mendapatkan data credential akun google
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        // signin ke firebase
        final User userDetails =
            (await firebaseAuth.signInWithCredential(credential)).user!;
        Get.dialog(
          const Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            ),
          ),
        );
        // save all value info login
        checkUserExists(userDetails.uid).then((value) {
          if (value) {
            getUserDataFromFirestore(userDetails.uid);
          } else {
            saveDataToFirestore(
              userDetails.displayName,
              userDetails.email,
              userDetails.uid,
              userDetails.photoURL,
            );
          }
        });
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            Get.snackbar('Error',
                "You already have an account with us. Use correct provider");
            break;
          case "null":
            Get.snackbar(
                'Error', "Some unexpected error while trying to sign in");
            break;
          default:
            Get.snackbar('Error', e.toString());
        }
      }
    }
  }

  Future<bool> checkUserExists(uid) async {
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (snap.exists) {
      print("EXISTING USER");
      return true;
    } else {
      print("NEW USER");
      return false;
    }
  }

  void getUserDataFromFirestore(uid) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) => {
              saveSession(
                snapshot['name'],
                snapshot['email'],
                snapshot['uid'],
                snapshot['image_url'],
              ),
            });
  }

  void saveDataToFirestore(name, email, uid, imageUrl) async {
    final DocumentReference r =
        FirebaseFirestore.instance.collection("users").doc(uid);
    var tmpDataInsert = {
      "name": name,
      "email": email,
      "uid": uid,
      "image_url": imageUrl,
    };

    await r.set(tmpDataInsert);
    saveSession(
      name,
      email,
      uid,
      imageUrl,
    );
  }

  void saveSession(name, email, uid, imageUrl) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('name', name);
    await sharedPreferences.setString('email', email);
    await sharedPreferences.setString('uid', uid);
    await sharedPreferences.setString('image_url', imageUrl);
    Get.back();
    Get.offAllNamed(
      '/profile',
      arguments: {
        "name": name,
        "email": email,
        "uid": uid,
        "image_url": imageUrl,
      },
    );
  }
}
