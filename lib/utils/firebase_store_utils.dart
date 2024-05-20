import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flareline/components/chats.dart';
import 'package:flareline_uikit/service/base_provider.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirebaseStoreUtils {
  static FirebaseFirestore db = FirebaseFirestore.instance;

  static save(
      String collectionName, String docName, Map<String, dynamic> data) async {
    await db.collection(collectionName).doc(docName).set(data);
  }

  static add(String collectionName, Map<String, dynamic> data) async {
    await db.collection(collectionName).add(data);
  }

  static Future<Map<String, dynamic>?> getOne(
      String collectionName, String docName) async {
    final docRef = db.collection(collectionName).doc(docName);
    DocumentSnapshot doc = await docRef.get();
    return doc.data() as Map<String, dynamic>;
  }

  static Future<List<Map<String, dynamic>>> listDicChildren(
      String collectionName, String configKey) async {
    final configKeyQuery = await FirebaseStoreUtils.db
        .collection(collectionName)
        .where('configKey', isEqualTo: configKey)
        .limit(1)
        .get();
    if (configKeyQuery.docs.isEmpty) {
      return [];
    }
    Map<String, dynamic> configKeyData =
        configKeyQuery.docs.elementAt(0).data();

    final query = await FirebaseStoreUtils.db
        .collection(collectionName)
        // .where('belongUid', isEqualTo: email)
        .where('parentId', isEqualTo: configKeyData['id'])
        .where('status', isEqualTo: 1)
        // .orderBy('orderNum')
        .get();

    if (query.docs.isNotEmpty) {
      return query.docs.map((element) {
        return element.data();
      }).toList(growable: false);
    }
    return [];
  }
}
