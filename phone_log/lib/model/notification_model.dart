import 'package:flutter/material.dart';
import 'package:phone_log/core/constant/app_colors.dart';

class NotificationModel {
  final String staus;
  final String name;
  final String date;
  final bool read;
  final Color color;

  NotificationModel(this.staus, this.name, this.date, this.read, this.color);
}

List<NotificationModel> notifications = [
  NotificationModel(
      'new call', 'Ali Hassan', '22-03-2023', false, AppColors.babyBlue),
  NotificationModel(
      'new call', 'Ali Hassan', '22-03-2023', true, AppColors.green),
  NotificationModel(
      'new call', 'Ali Hassan', '22-03-2023', true, AppColors.babyBlue),
];
