// ignore_for_file: unused_element

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';

import '../controllers/chat_controller.dart';
import 'widgets/input_chat_widget.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('controller.messages: ${controller.messages.length}');
    }
    return GetBuilder<ChatController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            _bubbleChat(controller, context),
            _buildBottomChatOperation(context),
          ],
        ),
      );
    });
  }

  Widget _bubbleChat(ChatController controller, BuildContext context) {
    final scrollController = ScrollController();

    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        itemCount: controller.messages.length,
        itemBuilder: (context, index) {
          bool isSender = controller.messages[index].isMe;
          return Column(
            crossAxisAlignment:
                isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              // Text(controller.messages[index].name),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 220),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isSender
                        ? AppColors.primaryColor.withOpacity(0.3)
                        : Colors.grey[350],
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(10),
                      topLeft:
                          isSender ? const Radius.circular(10) : Radius.zero,
                      topRight: const Radius.circular(10),
                      bottomRight:
                          isSender ? Radius.zero : const Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        controller.messages[index].message,
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        '${controller.messages[index].time.difference(DateTime.now()).inMinutes.abs()}m',
                        style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
            ],
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Sales ABC',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    );
  }

  Widget buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }

  Widget _buildBottomChatOperation(BuildContext context) {
    // final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -1),
            blurRadius: 10,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: InputChatWidget(
        controller: controller.chatTextController,
        onTapAdd: () => onTapAdd(context),
        onTapCamera: () => onTapCamera(context),
        onTapSend: () => onSend(context),
      ),
    );
  }

  void onTapCamera(BuildContext context) {
    final scrollController = ScrollController();

    controller.openCamera();

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void onSend(BuildContext context) {
    String chat = controller.chatTextController.text;
    controller.createMessage(
      isMe: true,
      message: chat,
    );
    controller.chatTextController.clear();
    final fileName = controller.selectedFile?.name;
    debugPrint(fileName);
  }

  void onTapAdd(BuildContext context) {
    controller.openGallery();
  }
}
