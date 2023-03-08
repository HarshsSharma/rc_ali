import 'package:flutter/material.dart';
import 'package:phone_log/core/constant/app_colors.dart';

class BottomNavigationItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final bool isActive;
  final VoidCallback onTap;
  const BottomNavigationItem({
    Key? key,
    required this.icon,
    this.isActive = false,
    required this.onTap,
    required this.activeIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: IconButton(
          icon: !isActive
              ? Icon(
                  icon,
                  size: 30,
                  color: AppColors.borderGrey,
                )
              : Icon(
                  activeIcon,
                  size: 30,
                  color: AppColors.scaffoldBG,
                ),
          onPressed: onTap),
    );
  }
}
