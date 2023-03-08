import 'package:flutter/material.dart';

import '../../core/constant/app_colors.dart';
import '../../model/calls_log_model.dart';
import 'default_info.dart';

class AllInfoCount extends StatelessWidget {
  const AllInfoCount({
    super.key,
    required this.name,
    required this.infoList,
    required this.title,
    required this.trailing,
  });

  final String name;
  final String title;
  final Widget trailing;
  final List<Info> infoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              title,
              style: const TextStyle(color: AppColors.white, fontSize: 20),
            ),
            Text(
              name,
              style: const TextStyle(color: AppColors.darkGrey, fontSize: 16),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: kTextTabBarHeight,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            color: AppColors.greyBG,
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.white,
              child: Column(
                children: infoList
                    .map((e) => DefaultInfo(
                          trailing: trailing,
                          onTap: () {},
                          info: e.info,
                          title: e.label,
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
