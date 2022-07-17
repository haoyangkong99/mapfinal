import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalexam/services/databaseService.dart';

class FirebaseStore implements DatabaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> readCollectionAsStream(
      String collection) {
    return db.collection(collection).snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> readCollectionAsFuture(
      String collection) async {
    return db.collection(collection).get();
  }

  Future<void> delete(String collection, String docid) async {
    try {
      db
          .collection(collection)
          .doc(docid)
          .delete()
          .onError((error, stackTrace) => {throw Exception()});
    } catch (e) {
      print(e);
    }
  }

  String getCreatedDocumentID(String collection) {
    return db.collection(collection).doc().id;
  }

  Future<void> add(String collection, String docid, dynamic data) async {
    await db.collection(collection).doc(docid).set(data);
  }

  Future<bool> update(String table, String docid, dynamic data) async {
    try {
      db
          .collection(table)
          .doc(docid)
          .update(data)
          .onError((error, stackTrace) => {throw Exception()});
    } catch (e) {
      return false;
    }
    return true;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> readDocumentAsStream(
      String collection, String document) {
    return db.collection(collection).doc(document).snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> readDocumentAsFuture(
      String collection, String document) async {
    return db.collection(collection).doc(document).get();
  }
}
