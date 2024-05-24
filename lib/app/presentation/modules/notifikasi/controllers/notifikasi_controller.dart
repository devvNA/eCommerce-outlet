// ignore_for_file: unnecessary_overrides

import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class NotifikasiController extends GetxController {
  final _imageFile = Rx<File?>(null);
  final _fileName = ''.obs;

  File? get imageFile => _imageFile.value;
  String get fileName => _fileName.value;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _imageFile.value = File(pickedFile.path);
      _fileName.value = path.basename(pickedFile.path);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
