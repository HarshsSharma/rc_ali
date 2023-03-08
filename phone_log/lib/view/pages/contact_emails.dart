import 'package:flutter/material.dart';
import 'package:phone_log/model/calls_log_model.dart';

import '../../core/constant/app_colors.dart';
import '../widget/all_info_count.dart';

class ContactEmailsScreen extends StatelessWidget {
  final List<Info> infoList;
  final String name;
  const ContactEmailsScreen(
      {super.key, required this.infoList, required this.name});

  @override
  Widget build(BuildContext context) {
    return AllInfoCount(
      trailing: const Icon(
        Icons.email,
        color: AppColors.scaffoldBG,
      ),
      name: name,
      infoList: infoList,
      title: 'Email',
    );
  }
}
