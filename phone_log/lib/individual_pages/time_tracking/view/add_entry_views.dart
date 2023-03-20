import 'package:flutter/material.dart';
import 'package:phone_log/individual_pages/time_tracking/controller/time_tracking_controller.dart';
import 'package:provider/provider.dart';

class EntryViews extends StatelessWidget {
  const EntryViews({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<TimeTrackingViewModel>().clear();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.read<TimeTrackingViewModel>().clear();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: const Color(0xff161652),
          toolbarHeight: kToolbarHeight,
          title: const Text('Add Time Entry'),
          actions: context.watch<TimeTrackingViewModel>().currentView == 4
              ? [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        context.read<TimeTrackingViewModel>().clear();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.white,
                      )),
                ]
              : [],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed:
                        context.watch<TimeTrackingViewModel>().currentView == 0
                            ? null
                            : () {
                                context
                                    .read<TimeTrackingViewModel>()
                                    .changeCurrentViewIndex(-1);
                              },
                  ),
                  Text(
                    context.watch<TimeTrackingViewModel>().entryViewsTitles[
                        context.watch<TimeTrackingViewModel>().currentView],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed:
                        context.watch<TimeTrackingViewModel>().currentView != 4
                            ? (context
                                                .watch<TimeTrackingViewModel>()
                                                .currentView ==
                                            1 &&
                                        context
                                            .watch<TimeTrackingViewModel>()
                                            .otherFields
                                            .isEmpty) ||
                                    (context
                                                .watch<TimeTrackingViewModel>()
                                                .currentView ==
                                            2 &&
                                        context
                                                .watch<TimeTrackingViewModel>()
                                                .otherFields
                                                .length !=
                                            2) ||
                                    (context
                                        .watch<TimeTrackingViewModel>()
                                        .entityController
                                        .text
                                        .isEmpty)
                                ? null
                                : () {
                                    context
                                        .read<TimeTrackingViewModel>()
                                        .changeCurrentViewIndex(1);
                                  }
                            : null,
                  ),
                ],
              ),
            ),
            if (context.watch<TimeTrackingViewModel>().currentView == 1 ||
                context.watch<TimeTrackingViewModel>().currentView == 2)
              SearchBox(
                hint: context.watch<TimeTrackingViewModel>().currentView == 1
                    ? 'Search for project'
                    : 'Search for tasks',
                onChanged: (value) {
                  if (context.read<TimeTrackingViewModel>().currentView == 1) {
                    context.read<TimeTrackingViewModel>().projectsSearch(value);
                  } else {
                    context.read<TimeTrackingViewModel>().tasksSearch(value);
                  }
                },
              ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: context.watch<TimeTrackingViewModel>().entryViews[
                    context.watch<TimeTrackingViewModel>().currentView],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  final String hint;
  final ValueChanged onChanged;
  const SearchBox({
    super.key,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18),
          filled: true,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
