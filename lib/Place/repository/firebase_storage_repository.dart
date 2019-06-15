import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:platzi_trips_app/Place/repository/firebase_storage_api.dart';

class FirebaseStorageRepository {
  final FirebaseStorageApi _storageApi = FirebaseStorageApi();

  Future<StorageUploadTask> uploadFile(String path, File image) => _storageApi.uploadFile(path, image);
}