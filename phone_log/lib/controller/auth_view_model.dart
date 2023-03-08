import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  bool passwordHidden = true;
  void togglePasswordVisibility() {
    passwordHidden = !passwordHidden;
    notifyListeners();
  }
}
