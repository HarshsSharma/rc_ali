import 'package:flutter/material.dart';
import 'package:phone_log/core/constant/app_colors.dart';

class DefaultInfo extends StatelessWidget {
  final BorderSide topBorder;
  final BorderSide bottomBorder;
  final String title;
  final String info;
  final Widget trailing;
  final VoidCallback onTap;
  const DefaultInfo({
    super.key,
    this.topBorder = const BorderSide(width: 0.0),
    this.bottomBorder = const BorderSide(width: 0.0),
    required this.title,
    required this.info,
    required this.onTap,
    this.trailing = const Icon(Icons.arrow_right_outlined),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: topBorder,
          bottom: bottomBorder,
        ),
      ),
      child: ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(color: AppColors.darkGrey, fontSize: 14),
          ),
          subtitle: Text(
            info,
            style: const TextStyle(
                color: AppColors.black, fontSize: 18, height: 1.8),
          ),
          trailing: trailing),
    );
  }
}
