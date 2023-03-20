import 'package:flutter/material.dart';
import 'package:phone_log/individual_pages/time_tracking/controller/time_tracking_controller.dart';
import 'package:phone_log/individual_pages/time_tracking/view/widget/radio_button.dart';
import 'package:provider/provider.dart';

class EntryOptions extends StatelessWidget {
  const EntryOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TimeTrackingViewModel>();
    return SingleChildScrollView(
      child: Column(
          children: viewModel.entites
              .map((e) => InkWell(
                    onTap: () {
                      context
                          .read<TimeTrackingViewModel>()
                          .changeRadioIndex(viewModel.entites.indexOf(e));
                      context
                          .read<TimeTrackingViewModel>()
                          .entityController
                          .text = e;
                    },
                    child: RadioOption(
                        isSelected: context
                                .watch<TimeTrackingViewModel>()
                                .selectedRadio ==
                            viewModel.entites.indexOf(e),
                        title: e),
                  ))
              .toList()),
    );
  }
}
