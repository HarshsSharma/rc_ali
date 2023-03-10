import 'package:flutter/material.dart';
import 'package:phone_log/core/constant/app_colors.dart';

class SectionsContainer extends StatelessWidget {
  final String title;
  const SectionsContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.borderLightGrey,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(title.toUpperCase()),
    );
  }
}
