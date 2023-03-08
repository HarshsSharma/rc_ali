import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../core/constant/app_colors.dart';
import '../../model/calls_log_model.dart';

class ContactItem extends StatelessWidget {
  final CallsLogModel contact;
  const ContactItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.darkGrey,
              icon: Icons.messenger,
            ),
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.darkGrey,
              icon: Icons.email,
            ),
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.darkGrey,
              icon: Icons.phone,
            ),
          ],
        ),
        child: ListTile(
          tileColor: AppColors.white,
          title: Text(
            contact.name,
            style: TextStyle(color: contact.color),
          ),
          subtitle: Text(
            contact.subject,
            style: const TextStyle(color: AppColors.darkGrey),
          ),
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(contact.image),
          ),
        ));
  }
}
