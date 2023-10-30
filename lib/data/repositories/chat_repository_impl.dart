import 'package:marvelindo_outlet/data/models/chat_model.dart';
import 'package:marvelindo_outlet/core/types.dart';

import '../../domain/repositories/chat_repository.dart';



class ChatRepositoryImpl implements ChatRepository {
  @override
  Future<ListChat> get messages async {
    final first = DateTime.now();
    final second = first.add(const Duration(minutes: -1));
    final third = second.add(const Duration(minutes: -1));
    final four = third.add(const Duration(minutes: -1));
    final five = four.add(const Duration(minutes: -1));
    final six = five.add(const Duration(minutes: -1));

    final messages = [
      ChatModel(
        isMe: true,
        message: 'Halo semua saya Andika dari SMAN 1 Purwokerto.',
        name: 'Jon',
        time: first,
      ),
      ChatModel(
        isMe: true,
        message: 'Halo semua saya Andika dari SMAN 2 Purwokerto.',
        name: 'Karina',
        time: first,
      ),
      ChatModel(
        isMe: true,
        message: 'Halo semua saya Andika dari SMAN 1 Purwokerto.',
        name: 'Ning',
        time: second,
      ),
      ChatModel(
        isMe: true,
        message: 'Halo semua saya Andika dari SMAN 1 Purwokerto.',
        name: 'Naufal',
        time: third,
      ),
      ChatModel(
        isMe: true,
        message: 'Halo semua saya Andika dari SMAN 1 Purwokerto.',
        name: 'Giselle',
        time: six,
      ),
    ];

    return messages;
  }
}
