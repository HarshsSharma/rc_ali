import 'package:flutter/material.dart';
import 'package:phone_log/core/components/list_view_section.dart';
import 'package:phone_log/core/constant/app_colors.dart';
import 'package:phone_log/model/notification_model.dart';

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
        body: ListViewSection(
          separatorBuilder: (p0, p1) => const SizedBox(),
          listLength: 10,
          listItem: (p0, p1) => Section(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: List.generate(
                  3,
                  (index) => Section(
                      oChanged: (v) {},
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      children: List.generate(
                          3,
                          (index) => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Item $index'),
                                ],
                              )),
                      child: Row(
                        children: const [
                          Icon(Icons.folder),
                          SizedBox(width: 10),
                          Text('Floder'),
                        ],
                      ),
                      collapseIcon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                      expandedIcon: const Icon(Icons.arrow_drop_down_sharp))),
              child: Row(
                children: const [
                  Icon(
                    Icons.folder,
                  ),
                  SizedBox(width: 10),
                  Text('Floder'),
                ],
              ),
              collapseIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              expandedIcon: const Icon(Icons.arrow_drop_down_sharp)),
          // body: ListView.separated(
          //   itemBuilder: (context, index) => NotificationItem(
          //     notification: notifications[index],
          //   ),
          //   separatorBuilder: (context, index) => const Divider(
          //     height: 0,
          //   ),
          //   itemCount: notifications.length,
          // ),
        ));
  }
}

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
