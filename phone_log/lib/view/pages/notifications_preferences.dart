import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_log/controller/layout_view_model.dart';
import 'package:phone_log/core/shared/enums.dart';
import 'package:phone_log/view/pages/edit_bulk.dart';
import 'package:phone_log/view/widget/section_container.dart';
import 'package:provider/provider.dart';

import '../../core/constant/app_colors.dart';

class NotificationsPreferences extends StatelessWidget {
  const NotificationsPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Notification Preferences',
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
        backgroundColor: AppColors.scaffoldBG,
        toolbarHeight: kTextTabBarHeight,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(children: [
        ListTile(
          title: const Text(
            'Mute Notification',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.arrow_right),
          onTap: () {
            showNotificationsSelectionDialog(context);
          },
        ),
        const SectionsContainer(title: 'Status'),
        ...statusTypes
            .map((e) => NotificationSwitch(
                  title: e,
                  value: context
                      .watch<LayoutViewModel>()
                      .notificationActive
                      .contains(e),
                  onChanged: (bool value) {
                    context
                        .read<LayoutViewModel>()
                        .toggleNotificaionAcctivation(e);
                  },
                ))
            .toList(),
        const SectionsContainer(title: 'categories'),
        ...categories
            .map((e) => NotificationSwitch(
                  title: e,
                  value: false,
                  onChanged: (bool value) {
                    print(value);
                  },
                ))
            .toList()
      ]),
    );
  }
}

class NotificationSwitch extends StatelessWidget {
  final String title;
  final void Function(bool)? onChanged;
  final bool value;
  const NotificationSwitch({
    super.key,
    required this.title,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Text(title.toUpperCase()),
              const Spacer(),
              CupertinoSwitch(
                thumbColor: Colors.white,
                // when the switch is off
                trackColor: Colors.black12,
                activeColor: AppColors.lightGreen,
                value: value,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

showNotificationsSelectionDialog(context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        contentPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.white,
                  )),
              const Text('Mute Notifications'),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: AppColors.black,
                  )),
            ],
          ),
          const Divider(
            color: AppColors.scaffoldBG,
          ),
          Column(children: [
            ...MuteDuration.values.asNameMap().keys.map((e) {
              final isSelected = e == 'for15min';
              return ListTile(
                  onTap: () {},
                  title: Text(e),
                  trailing: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: isSelected
                            ? null
                            : Border.all(color: AppColors.darkGrey),
                        color:
                            isSelected ? AppColors.babyBlue : AppColors.white,
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.check,
                      size: 20,
                      color: AppColors.white,
                    ),
                  ));
            }).toList(),
            ListTile(
                onTap: () {},
                title: const Text('Until I turn it back on'),
                trailing: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.darkGrey),
                      color: AppColors.white,
                      //isSelected ? AppColors.babyBlue :
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.check,
                    size: 20,
                    color: AppColors.white,
                  ),
                ))
          ])
        ],
      );
    },
  );
}
