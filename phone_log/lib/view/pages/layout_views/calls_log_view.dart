import 'package:flutter/material.dart';
import 'package:phone_log/core/router.dart';

import '../../../core/constant/app_colors.dart';
import '../../../model/calls_log_model.dart';
import '../../widget/call_log_item.dart';

class CallsLogView extends StatelessWidget {
  const CallsLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 20),
          child: Row(
            children: [
              const Text(
                'Calls',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list_rounded,
                    color: AppColors.white,
                  )),
              const Text(
                'filter',
                style: TextStyle(color: AppColors.white),
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: AppColors.white,
          child: ListView.separated(
              itemBuilder: (context, index) => CallLogItem(
                    logModel: callsLogs[index],
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppRouterNames.contactDetails,
                          arguments: callsLogs[index]);
                    },
                  ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: callsLogs.length),
        ))
      ],
    );
  }
}
