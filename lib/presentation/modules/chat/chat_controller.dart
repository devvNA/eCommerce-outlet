// ignore_for_file: unnecessary_overrides, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marvelindo_outlet/data/models/chat_model.dart';

import '../../../domain/repositories/chat_repository.dart';

class ChatController extends GetxController {
  final ChatRepository _chatRepository;

  ChatController({
    required ChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  final ImagePicker _picker = ImagePicker();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _chatTextController = TextEditingController();

  List<ChatModel> messages = List.empty(growable: true);
  final _isLoadingMessages = false.obs;
  final _selectedFile = Rx<XFile?>(null);

  bool get isLoadingMessages => _isLoadingMessages.value;
  XFile? get selectedFile => _selectedFile.value;
  ScrollController get scrollController => _scrollController;
  TextEditingController get chatTextController => _chatTextController;

  void createMessage({
    required bool isMe,
    required String message,
  }) {
    messages.add(ChatModel(
      name: 'Jon Wik',
      message: message,
      time: DateTime.now(),
      isMe: isMe,
    ));
    update();
  }

  Future<void> openCamera() async {
    final cameraFile = await _picker.pickImage(source: ImageSource.camera);
    _selectedFile.value = cameraFile;
  }

  Future<void> openGallery() async {
    final galleryFile = await _picker.pickImage(source: ImageSource.gallery);
    _selectedFile.value = galleryFile;
  }
}
