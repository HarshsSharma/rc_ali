import 'package:flutter/material.dart';
import 'package:phone_log/controller/layout_view_model.dart';
import 'package:phone_log/core/components/list_view_selection.dart';
import 'package:phone_log/core/router.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_colors.dart';
import '../../../model/calls_log_model.dart';
import '../../widget/call_log_item.dart';

class CallsLogView extends StatelessWidget {
  const CallsLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<LayoutViewModel>(
          builder: (context, value, child) {
            if (!value.callsLogSelectionMode) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 10, right: 20, left: 20),
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
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouterNames.filterLog);
                      },
                      icon: const Icon(
                        Icons.filter_list_rounded,
                        color: AppColors.white,
                      ),
                      label: const Text(
                        'filter',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  AppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: kToolbarHeight,
                    leading: const Center(child: Text('clear')),
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    title: const Text(
                      'Calls',
                      style: TextStyle(
                          color: AppColors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Divider(
                    color: AppColors.borderGrey,
                  ),
                  AppBar(
                    toolbarHeight: kToolbarHeight,
                    backgroundColor: Colors.transparent,
                    leading: const Center(
                      child: Text('5'),
                    ),
                    actions: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.messenger)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.email)),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRouterNames.editBulk);
                          },
                          icon: const Icon(Icons.edit)),
                    ],
                  )
                ],
              );
            }
          },
        ),
        Consumer<LayoutViewModel>(
          builder: (context, value, child) {
            if (value.hasConnection) {
              return const SizedBox();
            } else {
              return Container(
                color: AppColors.overlayRed,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.dangerous,
                      color: AppColors.darkred,
                    ),
                    Text(
                      '  No Internet Connection',
                      style: TextStyle(color: AppColors.darkred),
                    ),
                  ],
                ),
              );
            }
          },
        ),
        Expanded(
            child: Container(
          color: AppColors.white,
          child: ListViewSelection(
              onTap: (int index) {
                Navigator.pushNamed(context, AppRouterNames.contactDetails,
                    arguments: callsLogs[index]);
              },
              listLength: callsLogs.length,
              leadingInSelection: Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                    color: AppColors.babyBlue, shape: BoxShape.circle),
                child: const Icon(
                  Icons.check,
                  size: 20,
                  color: AppColors.white,
                ),
              ),
              leadingUnSelection: Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderGrey),
                    color: AppColors.white,
                    shape: BoxShape.circle),
                child: const Icon(
                  Icons.check,
                  size: 20,
                  color: AppColors.white,
                ),
              ),
              afteDissmis: () {
                context.read<LayoutViewModel>().toggleSelectioMode();
              },
              whenBeOnSelectionMode: () {
                context.read<LayoutViewModel>().toggleSelectioMode();
              },
              selectedColor: AppColors.overlayBlue,
              listItem: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CallLogItem(
                      logModel: callsLogs[index],
                    ),
                  ),
              separatorBuilder: (context, index) => const Divider(
                    height: 0,
                  )),
        ))
      ],
    );
  }
}
