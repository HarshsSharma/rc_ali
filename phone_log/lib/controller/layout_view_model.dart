import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:phone_log/core/shared/enums.dart';
import 'package:phone_log/view/pages/layout_views/calls_log_view.dart';
import 'package:phone_log/view/pages/layout_views/notifications_view.dart';
import 'package:phone_log/view/pages/layout_views/settings_view.dart';

import '../view/pages/layout_views/contacts_view.dart';

class LayoutViewModel extends ChangeNotifier {
  List<Widget> layoutViews = [
    const CallsLogView(),
    const ContactsView(),
    const NotificationsView(),
    const SettingsView(),
  ];
  int currentLayoutIndex = 0;
  bool hasConnection = true;
  String gridType = GridType.oneLine.name;
  bool callsLogSelectionMode = false;
  List<String> notificationActive = [];
  void changeCurrentLayoutIndex(int index) {
    currentLayoutIndex = index;
    notifyListeners();
  }

  void changeGridType(String type) {
    gridType = type;
    notifyListeners();
  }

  void toggleNotificaionAcctivation(String notification) {
    if (notificationActive.contains(notification)) {
      notificationActive.remove(notification);
    } else {
      notificationActive.add(notification);
    }
    notifyListeners();
  }

  void toggleSelectioMode() {
    callsLogSelectionMode = !callsLogSelectionMode;
    selected = 1;
    notifyListeners();
  }

  void checkConnection() async {
    hasConnection = await InternetConnectionChecker().hasConnection;
    notifyListeners();
  }

  int selected = 0;
  void increaseSelected() {
    selected += 1;
    notifyListeners();
  }

  void decreaseSelected() {
    selected -= 1;
    notifyListeners();
  }
}
