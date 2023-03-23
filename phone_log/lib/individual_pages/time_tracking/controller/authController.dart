import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ScrollController loginScroll = ScrollController();
  final GlobalKey loginButtonKey = GlobalKey();
  bool isVisible = false;
  void toggleVisibilty() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
