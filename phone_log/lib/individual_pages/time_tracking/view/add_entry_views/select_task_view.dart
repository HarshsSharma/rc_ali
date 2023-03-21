import 'package:flutter/material.dart';

import 'package:phone_log/individual_pages/time_tracking/view/widget/radio_button.dart';
import 'package:provider/provider.dart';

import '../../controller/time_tracking_controller.dart';
import '../add_time_entry.dart';

class SelectTaskView extends StatelessWidget {
  const SelectTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TimeTrackingViewModel>();
    return SingleChildScrollView(
      child: Column(
          children: viewModel.searchList
              .map((e) => InkWell(
                    onTap: () {
                      context
                          .read<TimeTrackingViewModel>()
                          .changeRadioIndex(viewModel.searchList.indexOf(e));
                      if (context
                              .read<TimeTrackingViewModel>()
                              .otherFields
                              .length ==
                          2) {
                        context.read<TimeTrackingViewModel>().otherFields[1] =
                            EntryField(
                          controller: TextEditingController(text: e),
                          hint: 'Task',
                          onTap: () {},
                        );
                      } else {
                        context
                            .read<TimeTrackingViewModel>()
                            .otherFields
                            .add(EntryField(
                              controller: TextEditingController(text: e),
                              hint: 'Task',
                              onTap: () {},
                            ));
                      }
                    },
                    child: RadioOption(
                        isSelected: context
                                .watch<TimeTrackingViewModel>()
                                .selectedRadio ==
                            viewModel.searchList.indexOf(e),
                        title: e),
                  ))
              .toList()),
    );
  }
}
