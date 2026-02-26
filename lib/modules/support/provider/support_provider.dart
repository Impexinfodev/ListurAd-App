import 'package:flutter/material.dart';
import 'package:list_ur_add/modules/support/model/chat_message_model.dart';

class SupportProvider with ChangeNotifier {

  final List<String> supportChips = [
    'Payment Issue',
    'Account Problem',
    'Profile Update',
    'Subscription',
  ];

  final List<ChatMessageModel> messages = [
    ChatMessageModel(
      message: "Hi there! 👋 How can I help you today?",
      isMe: false,
      time: DateTime.now(),
    ),
  ];

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    messages.add(ChatMessageModel(message: text, isMe: true, time: DateTime.now()));
    notifyListeners();
  }
}
