import 'package:flutter/material.dart';
import 'package:phone_log/core/constant/app_colors.dart';
import 'package:phone_log/model/notification_model.dart';
import 'package:phone_log/view/widget/notification_item.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: kToolbarHeight,
        backgroundColor: AppColors.scaffoldBG,
        title: const Text(
          'Notifications',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: AppColors.white),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => NotificationItem(
          notification: notifications[index],
        ),
        separatorBuilder: (context, index) => const Divider(
          height: 0,
        ),
        itemCount: notifications.length,
      ),
    );
  }
}
