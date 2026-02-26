class ChatMessageModel {
  final String message;
  final bool isMe;
  final DateTime time;

  ChatMessageModel({
    required this.message,
    required this.isMe,
    required this.time,
  });
}
