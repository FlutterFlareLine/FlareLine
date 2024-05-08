import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flareline/components/chats.dart';
import 'package:flareline/provider/base_provider.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirebaseStoreProvider extends BaseProvider {

  late FirebaseFirestore db;

  FirebaseStoreProvider(super.context);

  @override
  void onViewCreated(BuildContext context) {
    db = FirebaseFirestore.instance;
  }

  save(String collectionName, String docName, Map<String, dynamic> data) async {
    await db.collection(collectionName).doc(docName).set(data);
  }

  add(String collectionName, Map<String, dynamic> data) async {
    await db.collection(collectionName).add(data);
  }

  Future<Map<String, dynamic>?> getOne(
      String collectionName, String docName) async {
    final docRef = db.collection(collectionName).doc(docName);
    DocumentSnapshot doc = await docRef.get();
    return doc.data() as Map<String, dynamic>;
  }
}
