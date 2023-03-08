import 'package:flutter/material.dart';
import 'package:phone_log/core/constant/app_colors.dart';

import '../../model/calls_log_model.dart';
import '../widget/all_info_count.dart';

class ContactPhonesScreen extends StatelessWidget {
  final List<Info> infoList;
  final String name;
  const ContactPhonesScreen(
      {super.key, required this.infoList, required this.name});

  @override
  Widget build(BuildContext context) {
    return AllInfoCount(
      trailing: const Icon(
        Icons.phone,
        color: AppColors.scaffoldBG,
      ),
      name: name,
      infoList: infoList,
      title: 'Phone',
    );
  }
}
