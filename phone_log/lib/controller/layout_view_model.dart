import 'package:flutter/material.dart';
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
  String gridType = GridType.oneLine.name;
  void changeCurrentLayoutIndex(int index) {
    currentLayoutIndex = index;
    notifyListeners();
  }

  void changeGridType(String type) {
    gridType = type;
    notifyListeners();
  }
}
