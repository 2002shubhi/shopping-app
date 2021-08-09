import 'package:ceramicstore/SharedPreferences.dart';
import 'package:ceramicstore/models/user.dart';

import 'package:ceramicstore/screens/nav_bottom.dart';

import 'package:ceramicstore/New/Config.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethods{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  getCurrentUser()async{
    return  _auth.currentUser;
  }

  UserData _userFromFirebaseUser(User user){ //yay
    return  UserData(userId: user.uid);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      User user =
      (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).user; //yo
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  Future signUpwithEmailandPassword(String email,String password) async{

    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser =result.user; //yo
      return _userFromFirebaseUser(firebaseUser); //yo


    }catch(e){
      print(e.toString());

    }
  }

  Future resetPass(String email) async{
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());

    }
  }

  signInWithGoogle(BuildContext context) async{
    final FirebaseAuth _firebaseAuth =FirebaseAuth.instance;
    final AuthCredential credential = GoogleAuthProvider.credential(
    );
    UserCredential result= await _firebaseAuth.signInWithCredential(credential);
    User userDetails = result.user; //yo

    if (result != null) {
      SharedPreferenceHelper().saveUserEmail(userDetails.email); //yo
      SharedPreferenceHelper().saveUserId(userDetails.uid);
      SharedPreferenceHelper()
          .saveUserName(userDetails.email.replaceAll("@gmail.com", "")); //yo
      SharedPreferenceHelper().saveDisplayName(userDetails.displayName); //yo
      SharedPreferenceHelper().saveUserProfileUrl(userDetails.photoURL); //yo

      Map<String, dynamic> userInfoMap = {
        "email": userDetails.email,
        "username": (userDetails.email.split("@"))[0], //yo
        "name": userDetails.displayName,
        "imgUrl": userDetails.photoURL
      };
      DatabaseMethods().addUserInfoToDB(userDetails.uid, userInfoMap).then(
              (value){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));

          }
      );

    }
    Map<String, dynamic> userInfoMap = {
      "email": userDetails.email,
      "username": (userDetails.email.split("@"))[0], //yo
      "name": userDetails.displayName,
      "imgUrl": userDetails.photoURL
    };
    await SharedPreferenceHelper().saveDisplayName(userInfoMap["name"]);
    await SharedPreferenceHelper().saveUserEmail(userInfoMap["email"]);
    await SharedPreferenceHelper().saveUserProfileUrl(userInfoMap["imgUrl"]);
    await SharedPreferenceHelper().saveUserName(userInfoMap["username"]);
  }


  }


