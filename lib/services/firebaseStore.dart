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
}
