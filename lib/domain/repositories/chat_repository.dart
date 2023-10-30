import '../../core/types.dart';

abstract class ChatRepository {
  Future<ListChat> get messages;
}
