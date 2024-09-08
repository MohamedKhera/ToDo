import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firestore_helper.dart';
import 'package:todo/model/user.dart' as MyUser;

class Authprovider extends ChangeNotifier{
  User? FirebaseUserAuthUser;
  MyUser.User? databaseUser;

  void setUsers(User? newFirebaseUserAuth,MyUser.User? newDatabaseUser ){
    FirebaseUserAuthUser = newFirebaseUserAuth;
    databaseUser = newDatabaseUser;
  }

  bool isFirebaseUserLogIn(){
    if(FirebaseAuth.instance.currentUser == null) return false;
    FirebaseUserAuthUser = FirebaseAuth.instance.currentUser;
    return true;
  }


  Future<void> retrieveDatabaseUserData()async{
    try{
      databaseUser = await FirestoreHelper.GetUser(FirebaseUserAuthUser!.uid);
    }catch(error){
      print(error);
    }
  }

}