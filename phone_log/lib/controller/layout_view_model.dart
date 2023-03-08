import 'package:flutter/material.dart';
import 'package:phone_log/view/pages/layout_views/calls_log_view.dart';

import '../view/pages/layout_views/contacts_view.dart';

class LayoutViewModel extends ChangeNotifier {
  List<Widget> layoutViews = [
    const CallsLogView(),
    const ContactsView(),
  ];
  int currentLayoutIndex = 0;
  void changeCurrentLayoutIndex(int index) {
    currentLayoutIndex = index;
    notifyListeners();
  }
}
