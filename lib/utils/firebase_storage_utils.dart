


import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';


class FirebaseStorageUtils {
  static final storage = FirebaseStorage.instance;

  static Future<String>  uploadFile(String fileName,PlatformFile platformFile) async {

    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child('images/${fileName}');
      if(kIsWeb) {
        final fileBytes = platformFile.bytes;
        await imageRef.putData(fileBytes!);
      }else{
        final filePath = platformFile.path;
        await imageRef.putFile(File(filePath!));
      }
      final imageUrl = await imageRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('upload fail：$e');
    }
    return '';
  }
}
