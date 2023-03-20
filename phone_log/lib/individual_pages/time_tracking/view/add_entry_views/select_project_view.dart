import 'package:flutter/material.dart';
import 'package:phone_log/individual_pages/time_tracking/view/add_time_entry.dart';

import 'package:phone_log/individual_pages/time_tracking/view/widget/radio_button.dart';
import 'package:provider/provider.dart';

import '../../controller/time_tracking_controller.dart';

class SelectProjectView extends StatelessWidget {
  const SelectProjectView({super.key});

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
                      // context
                      //     .read<TimeTrackingViewModel>()
                      //     .otherControllers
                      //     .add();
                      if (context
                          .read<TimeTrackingViewModel>()
                          .otherFields
                          .isNotEmpty) {
                        context.read<TimeTrackingViewModel>().otherFields[0] =
                            EntryField(
                          controller: TextEditingController(text: e),
                          hint: 'Project',
                          onTap: () {},
                        );
                      } else {
                        context
                            .read<TimeTrackingViewModel>()
                            .otherFields
                            .add(EntryField(
                              controller: TextEditingController(text: e),
                              hint: 'Project',
                              onTap: () {},
                            ));
                      }
                    },
                    child: RadioOption(
                        isSelected: context
                                .watch<TimeTrackingViewModel>()
                                .selectedRadio ==
                            viewModel.projects.indexOf(e),
                        title: e),
                  ))
              .toList()),
    );
  }
}
