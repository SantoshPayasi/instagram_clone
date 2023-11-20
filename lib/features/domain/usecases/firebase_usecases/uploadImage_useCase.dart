// ignore_for_file: file_names

import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';
import 'dart:io';

class UploadImageUseCase {
  final FirebaseRepository repository;

  UploadImageUseCase({required this.repository});

  Future<String> call(File? file, bool isPost, String childName) async {
    return repository.uploadImageToStorage(file, isPost, childName);
  }
}
