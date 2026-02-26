import 'package:flutter/material.dart';
import 'package:list_ur_add/modules/inbox/model/chat_message.dart';

class ChatProvider extends ChangeNotifier {

  final List<ChatMessage> messages = [
    ChatMessage(
      text: 'Hello Uncle Nice to talk with you',
      time: DateTime.now(),
      isMe: false,
    ),
    ChatMessage(
      text: 'Same here 🙂',
      time: DateTime.now(),
      isMe: true,
    ),
    ChatMessage(
      text: 'Kal milte hain',
      time: DateTime.now().subtract(const Duration(days: 1)),
      isMe: false,
    ),
  ];

  void addMessage(ChatMessage message) {
    messages.add(message);
    notifyListeners();
  }

  void addMessages(List<ChatMessage> messages) {
    messages.addAll(messages);
    notifyListeners();
  }

  void clearMessages() {
    messages.clear();
    notifyListeners();
  }
}
