class ChatMessage {
  final String text;
  final DateTime time;
  final bool isMe;

  ChatMessage({
    required this.text,
    required this.time,
    required this.isMe,
  });
}
