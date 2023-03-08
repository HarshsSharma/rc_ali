import 'package:flutter/material.dart';

import '../../model/calls_log_model.dart';
import '../widget/all_info_count.dart';

class ContactAddressesScreen extends StatelessWidget {
  final List<Info> infoList;
  final String name;

  const ContactAddressesScreen(
      {super.key, required this.infoList, required this.name});

  @override
  Widget build(BuildContext context) {
    return AllInfoCount(
      trailing: const SizedBox(),
      name: name,
      infoList: infoList,
      title: 'Address',
    );
  }
}
