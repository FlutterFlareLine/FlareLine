import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flareline/utils/cache_util.dart';

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
      String collectionName, String configKey,
      {bool? enableCache}) async {
    if (enableCache != null && enableCache) {
      String cacheKey = 'collection_${collectionName}_${configKey}';
      String? json = CacheUtil.instance.read(cacheKey);
      if(json!=null && json!='') {
        print('json data ${json}}');
        List<Map<String, dynamic>> cacheData = jsonDecode(json);
        if (cacheData != null && cacheData.isNotEmpty) {
          return cacheData;
        }
      }
    }

    final configKeyQuery = await db
        .collection(collectionName)
        .where('configKey', isEqualTo: configKey)
        .limit(1)
        .get();
    if (configKeyQuery.docs.isEmpty) {
      return [];
    }
    Map<String, dynamic> configKeyData =
        configKeyQuery.docs.elementAt(0).data();

    final query = await db
        .collection(collectionName)
        // .where('belongUid', isEqualTo: email)
        .where('parentId', isEqualTo: configKeyData['id'])
        .where('status', isEqualTo: 1)
        // .orderBy('orderNum')
        .get();

    if (query.docs.isNotEmpty) {
      List<Map<String, dynamic>> data = query.docs.map((element) {
        return element.data();
      }).toList(growable: false);
      data.sort((a, b) {
        return a['orderNum'].compareTo(b['orderNum']);
      });

      if (enableCache != null && enableCache) {
        if (data != null && data.isNotEmpty) {
          String cacheKey = 'collection_${collectionName}_${configKey}';
          CacheUtil.instance.write(cacheKey, jsonEncode(data));
        }
      }
      return data;
    }
    return [];
  }

  static Future<void> delete(String collectionName, String id) async {
    final queryMessage =
        await db.collection(collectionName).where('id', isEqualTo: id).get();
    if (queryMessage.docs.isNotEmpty) {
      String docName = queryMessage.docs.elementAt(0).id;
      return await db.collection(collectionName).doc(docName).delete().then(
            (doc) => print("Document deleted"),
            onError: (e) => print("Error updating document $e"),
          );
    }
  }
}
