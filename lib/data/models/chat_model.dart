import 'dart:convert';

class ChatModel {
  final String name;
  final String message;
  final DateTime time;
  final bool isMe;
  
  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.isMe,
  });

  ChatModel copyWith({
    String? name,
    String? message,
    DateTime? time,
    bool? isMe,
  }) {
    return ChatModel(
      name: name ?? this.name,
      message: message ?? this.message,
      time: time ?? this.time,
      isMe: isMe ?? this.isMe,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'message': message,
      'time': time.millisecondsSinceEpoch,
      'isMe': isMe,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      name: map['name'] ?? '',
      message: map['message'] ?? '',
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      isMe: map['isMe'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatModel(name: $name, message: $message, time: $time, isMe: $isMe)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatModel &&
        other.name == name &&
        other.message == message &&
        other.time == time &&
        other.isMe == isMe;
  }

  @override
  int get hashCode {
    return name.hashCode ^ message.hashCode ^ time.hashCode ^ isMe.hashCode;
  }
}
