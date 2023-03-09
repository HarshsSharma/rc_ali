import 'package:flutter/material.dart';
import 'package:phone_log/controller/layout_view_model.dart';
import 'package:phone_log/core/constant/app_colors.dart';
import 'package:phone_log/core/shared/enums.dart';
import 'package:phone_log/model/calls_log_model.dart';
import 'package:provider/provider.dart';

class CallLogItem extends StatelessWidget {
  final VoidCallback onTap;
  final CallsLogModel logModel;
  const CallLogItem({super.key, required this.onTap, required this.logModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    logModel.name,
                    style: TextStyle(color: logModel.color, fontSize: 18),
                  ),
                ),
                Chip(
                  label: Row(
                    children: [
                      Text(
                        logModel.status,
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
            if (context.watch<LayoutViewModel>().gridType ==
                GridType.threeLine.name)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      logModel.phones[0].info,
                      style: const TextStyle(
                          color: AppColors.darkGrey, fontSize: 16),
                    ),
                  ),
                  const Text(
                    '4:18 pm',
                    style: TextStyle(color: AppColors.darkGrey, fontSize: 16),
                  ),
                ],
              ),
            if (context.watch<LayoutViewModel>().gridType !=
                GridType.oneLine.name)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      logModel.reasong,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: AppColors.darkGrey, fontSize: 16),
                    ),
                  ),
                  const Icon(
                    Icons.info_outline,
                    color: AppColors.darkred,
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
