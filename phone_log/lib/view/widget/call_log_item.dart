import 'package:flutter/material.dart';
import 'package:phone_log/core/constant/app_colors.dart';

class CallLogItem extends StatelessWidget {
  final String status;
  final String name;
  final Color color;
  final VoidCallback onTap;
  const CallLogItem(
      {super.key,
      required this.status,
      required this.name,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Row(
          children: [
            Text(
              name,
              style: TextStyle(color: color, fontSize: 18),
            ),
            const Spacer(),
            Chip(
              label: Row(
                children: [
                  Text(
                    status,
                    style: const TextStyle(color: AppColors.white),
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: AppColors.white,
                  )
                ],
              ),
              backgroundColor: AppColors.darkGrey,
            )
          ],
        ),
      ),
    );
  }
}
