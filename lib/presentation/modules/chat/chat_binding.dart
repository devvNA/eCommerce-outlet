import 'package:get/get.dart';

import '../../../data/repositories/chat_repository_impl.dart';
import '../../../domain/repositories/chat_repository.dart';
import 'chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatController>(
      ChatController(chatRepository: Get.find<ChatRepository>()),
    );
    Get.put<ChatRepository>(
      ChatRepositoryImpl(),
    );
  }
}
