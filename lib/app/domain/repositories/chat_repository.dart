import '../../core/utils/types.dart';

abstract class ChatRepository {
  Future<ListChat> get messages;
}
