import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/model/user.dart';

class FirestoreHelper {
  // to Add you Must get the collection
  static CollectionReference<User> getUserCollection() {
    var reference = FirebaseFirestore.instance.collection("User").withConverter(
        fromFirestore: (snapshot, options) {
      Map<String, dynamic>? data = snapshot.data();
      return User.fromFirestore(data ?? {});
    }, toFirestore: (user, options) {
      return user.toFirestore();
    });
    return reference;
  }

  static Future<void> AddUser(String email, String fullname, String userID) async {
    var document = getUserCollection().doc(userID);
    await document.set(User(id: userID, email: email, fullname: fullname));
  }

  static Future<User?> GetUser(String userID) async {
    var document = getUserCollection().doc(userID);

    var snapshot = await document.get();

    User? user = snapshot.data();

    return user;
  }
}
