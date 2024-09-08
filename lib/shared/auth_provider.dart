import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firestore_helper.dart';
import 'package:todo/model/user.dart' as MyUser;

class Authprovider extends ChangeNotifier{
  User? firebaseUserAuthUser;
  MyUser.User? databaseUser;

  void setUsers(User? newFirebaseUserAuth,MyUser.User? newDatabaseUser ){
    firebaseUserAuthUser = newFirebaseUserAuth;
    databaseUser = newDatabaseUser;
    notifyListeners();
  }

  bool isFirebaseUserLogIn(){
    if(FirebaseAuth.instance.currentUser == null) return false;
    firebaseUserAuthUser = FirebaseAuth.instance.currentUser;
    return true;
  }


  Future<void> retrieveDatabaseUserData()async{
    try{
      databaseUser = await FirestoreHelper.GetUser(firebaseUserAuthUser!.uid);
    }catch(error){
      print(error);
    }
    print(databaseUser?.email);
  }


 Future<void> signOut()async{
    firebaseUserAuthUser=null;
    databaseUser =null;
    await FirebaseAuth.instance.signOut();
  }

}