import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseService {
  Stream<QuerySnapshot<Map<String, dynamic>>> readCollectionAsStream(
      String collection);
  Future<QuerySnapshot<Map<String, dynamic>>> readCollectionAsFuture(
      String collection);
  Future<void> delete(String collection, String docid);
  Future<DocumentSnapshot<Map<String, dynamic>>> readDocumentAsFuture(
      String collection, String document);
  Stream<DocumentSnapshot<Map<String, dynamic>>> readDocumentAsStream(
      String collection, String document);
}
