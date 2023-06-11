import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commonFireBaseStorageProvider = Provider(
        (ref) => CommonFireBaseStorage(
            firebaseStorage: FirebaseStorage.instance
        )
);

class CommonFireBaseStorage {
  final FirebaseStorage firebaseStorage;
  CommonFireBaseStorage({
    required this.firebaseStorage,
});

  Future<String> storeFileToFireBase(String ref, File file) async{
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl =  await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}