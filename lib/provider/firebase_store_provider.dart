import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirebaseStoreProvider extends ChangeNotifier {
  FirebaseStoreProvider() {
    init();
  }

  late FirebaseFirestore db;

  void init() {
    db = FirebaseFirestore.instance;
  }

  save(String collectionName, String docName, Map<String, dynamic> data) async {
    await db.collection(collectionName).doc(docName).set(data);
  }

  Future<Map<String, dynamic>?> getOne(
      String collectionName, String docName) async {
    final docRef = db.collection(collectionName).doc(docName);
    DocumentSnapshot doc = await docRef.get();
    return doc.data() as Map<String, dynamic>;
  }
}
