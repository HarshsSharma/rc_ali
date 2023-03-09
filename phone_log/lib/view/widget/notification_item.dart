import 'package:flutter/material.dart';
import 'package:phone_log/core/constant/app_colors.dart';
import 'package:phone_log/model/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: notification.read ? AppColors.white : AppColors.lightGreen2,
      title: RichText(
          text: TextSpan(
              text: notification.staus.toUpperCase(),
              style: const TextStyle(color: AppColors.black, fontSize: 18),
              children: [
            TextSpan(
                text: '  ${notification.name}',
                style: TextStyle(color: notification.color)),
          ])),
      subtitle: Text(
        notification.date,
        style: const TextStyle(fontSize: 14, color: AppColors.darkGrey),
      ),
    );
  }
}
