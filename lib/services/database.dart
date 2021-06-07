import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_note/models/noteModel.dart';
import 'package:flutter_note/models/user.dart';
import 'package:uuid/uuid.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userCollection = "users";
  final String noteCollection = "notes";

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(user.id)
          .set({"id": user.id, "name": user.name, "email": user.email});
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(userCollection).doc(uid).get();
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addNote(String uid, String title, String body) async {
    try {
      var uuid = Uuid().v4();
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(uuid)
          .set({
        "id": uuid,
        "title": title,
        "body": body,
        "creationDate": Timestamp.now(),
      });
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> updateNote(
      String uid, String title, String body, String id) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(id)
          .update({
        "title": title,
        "body": body,
        "creationDate": Timestamp.now(),
      });
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> delete(String uid, String id) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(id)
          .delete();
    } catch (e) {
      print(e.message);
    }
  }

  Stream<List<NoteModel>> noteStream(String uid) {
    return _firestore
        .collection(userCollection)
        .doc(uid)
        .collection(noteCollection)
        .orderBy("creationDate", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<NoteModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(NoteModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
