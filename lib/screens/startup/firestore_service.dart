import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptoapp/models/user.dart';

class FirestoreService {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future createUser(AppUser user) async {
    await users.doc(user.id).set(user.toJson()).catchError((onError) => {
      print('error caught in firestore service')
  });
  }

  Future getUser(String uid) async {
    Map<String, dynamic> userData = (await users.doc(uid).get().catchError((onError) => {
      print('error caught in firestore service')
    })) as Map<String, dynamic>;

    return AppUser.fromData(userData);
  }
}