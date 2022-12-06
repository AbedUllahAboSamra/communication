import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_sulution_test/core/error/exception.dart';
import 'package:http/http.dart' as http;
import '../../../domain/entities/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/users_model.dart';

abstract class UserRemoteDataSource {
  Future<Users> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Users> getUserData({
    required String id,
  });

  Future<Users> signUp({
    required String email,
    required String name,
    required String password,
  });

  Future<Users> signInWithFacebook();
  Future<Users> signInWithGoogle();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final FirebaseAuth authInstance;
  final FirebaseFirestore storeInstance;

  UserRemoteDataSourceImpl({
    required this.authInstance,
    required this.storeInstance,
  });

  //loginUserWithEmailAndPassword
  @override
  Future<Users> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    // TODO: implement loginUserWithEmailAndPassword
    UserCredential user = await authInstance.signInWithEmailAndPassword(
        email: email, password: password);
    if (user.user != null) {
      print("loginUserWithEmailAndPassword  + user.user != null ");
      var data =
          await storeInstance.collection("users").doc(user.user!.uid).get();
      if (data.data() != null) {
        print("loginUserWithEmailAndPassword  + done ");
        return UserModel.fromJson(json: data.data()!, userId: user.user!.uid);
      } else {
        throw ServerException();
      }
    }
    print("loginUserWithEmailAndPassword  + ServerException ");
    throw ServerException();
  }
  //getUserData

  @override
  Future<Users> getUserData({required String id}) async {
    // TODO: implement getUserData
    var data = await storeInstance.collection("users").doc(id).get();
    if (data.data() != null) {
      print("getUserData  + done");
      return UserModel.fromJson(
        json: data.data()!,
        userId: id,
      );
    } else {
      throw ServerException();
    }
  }
  //signUp

  @override
  Future<Users> signUp(
      {required String email,
      required String name,
      required String password}) async {
    // TODO: implement signUp

    UserCredential userCredential = await authInstance
        .createUserWithEmailAndPassword(email: email, password: password);

    if (userCredential.user != null) {
      var userModel = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        password: password,
        imageUrl: "https://i.stack.imgur.com/l60Hf.png",
        phone: "set phone number",
        dateOfBirth: "select your date of birth",
        gender: "select",
        location: "select your location",
      );
      storeInstance
          .collection("users")
          .doc(userCredential.user!.uid)
          .set(userModel.toJson());

      return userModel;
    }

    throw ServerException();
  }


  //facebook login
  @override
  Future<Users> signInWithFacebook() async {
    // TODO: implement signInWithFacebook
    final LoginResult result = await FacebookAuth.instance
        .login(permissions: (['email', 'public_profile']));
    final token = result.accessToken!.token;
    final graphResponse = await http.get(Uri.parse( 'https://graph.facebook.com/'
        'v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));
    final profile = jsonDecode(graphResponse.body);

    final AuthCredential facebookCredential =
        FacebookAuthProvider.credential(token);
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(facebookCredential);
    final uId = userCredential.user!.uid;
    var data = await storeInstance.collection("users").doc(uId).get();
    if (data.data() == null) {
      final user = UserModel(
        id: uId,
        name: profile['first_name'],
        email: profile['email'],
        password: '******',
        imageUrl: "https://i.stack.imgur.com/l60Hf.png",
        phone: "set phone number",
        dateOfBirth: "select your birth day",
        gender: "select your gender",
        location: "select your location",
      );
      storeInstance.collection("users").doc(uId).set(user.toJson());
      return user;
    }
    else if (data.data() != null) {
      var data = await storeInstance.collection("users").doc(uId).get();
      return UserModel.fromJson(json: data.data()!, userId: uId);
    }
    throw ServerException();
  }



  // google login
  @override
  Future<Users> signInWithGoogle() async {
    // TODO: implement signInWithGoogle
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if(googleAccount != null){
      print(googleAccount.email + " email ");
    }
   final googleAuth = await googleAccount?.authentication;

    final userCredential = await FirebaseAuth.instance.signInWithCredential(GoogleAuthProvider.credential(accessToken:googleAuth?.accessToken ,idToken:googleAuth?.idToken ));

    final uId = userCredential.user!.uid;
    var data = await storeInstance.collection("users").doc(uId).get();
    if (data.data() == null) {
      final user = UserModel(
        id: uId,
        name: googleAccount?.displayName.toString()??"",
        email: googleAccount?.email.toString()??"",
        password: '******',
        imageUrl: googleAccount?.photoUrl.toString()??"",
        phone: "set phone number",
        dateOfBirth: "select your birth day",
        gender: "select your gender",
        location: "select your location",
      );
      storeInstance.collection("users").doc(uId).set(user.toJson());
      return user;
    }
    else if (data.data() != null) {
      var data = await storeInstance.collection("users").doc(uId).get();
      print("${data.data()}DATA");
      return Future(() => UserModel.fromJson(json: data.data()!, userId: uId));
    }
    throw ServerException();


   }

}
