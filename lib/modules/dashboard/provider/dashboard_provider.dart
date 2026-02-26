import 'package:flutter/material.dart';
import 'package:list_ur_add/modules/home/views/home_view.dart';
import 'package:list_ur_add/modules/inbox/views/inbox_view.dart';
import 'package:list_ur_add/modules/market/views/market_view.dart';
import 'package:list_ur_add/modules/notifications/views/notification_view.dart';

class DashboardProvider with ChangeNotifier {
  int selectedIndex = 0;
  String? selectedCategory;

  final List<String> categories = ['Category', 'Sub Category', 'Type Category'];

  final List<Widget> pages = [
    const HomeView(),
    InboxView(),
    MarketView(),
    NotificationView(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
