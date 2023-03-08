import 'package:flutter/material.dart';
import 'package:phone_log/model/calls_log_model.dart';

import '../../../core/constant/app_colors.dart';
import '../../widget/contact_item.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: kToolbarHeight,
          backgroundColor: AppColors.scaffoldBG,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          title: const Text(
            'Contacts',
            style: TextStyle(fontSize: 22, color: AppColors.white),
          ),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => ContactItem(
            contact: callsLogs[index],
          ),
          itemCount: callsLogs.length,
          separatorBuilder: (context, index) => const Divider(),
        ));
  }
}
