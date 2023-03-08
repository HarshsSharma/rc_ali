import 'package:flutter/material.dart';
import 'package:phone_log/core/constant/app_colors.dart';

class AddNewEntry extends StatefulWidget {
  const AddNewEntry({super.key});

  @override
  State<AddNewEntry> createState() => _AddNewEntryState();
}

class _AddNewEntryState extends State<AddNewEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'New Entry',
          style: TextStyle(color: AppColors.white, fontSize: 22),
        ),
        leadingWidth: 80,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () {},
              child: const Text(
                'Cancel',
                style: TextStyle(color: AppColors.white, fontSize: 18),
              )),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Save',
                style: TextStyle(color: AppColors.white, fontSize: 18),
              )),
        ],
      ),
    );
  }
}
