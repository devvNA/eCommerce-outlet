import '../../data/types.dart';

abstract class ChatRepository {
  Future<ListChat> get messages;
}
