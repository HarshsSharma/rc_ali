import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phone_log/individual_pages/time_tracking/controller/time_tracking_controller.dart';
import 'package:phone_log/individual_pages/time_tracking/model/time_tracking_model.dart';
import 'package:provider/provider.dart';

class TimeTracking extends StatelessWidget {
  const TimeTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff161652),
        toolbarHeight: kToolbarHeight,
        title: const Text('Time Tracking'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'Today: ${DateFormat('dd-MMM-yy').format(DateTime.now())}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            height: 1,
          ),
          Row(
            children: context
                .read<TimeTrackingViewModel>()
                .getTheWeekDayes(DateTime.now())
                .map((e) => Expanded(
                      child: Consumer<TimeTrackingViewModel>(
                          builder: (context, value, child) {
                        return DayCard(
                            day: e,
                            isSelected: value.dateSelected == e.weekday);
                      }),
                    ))
                .toList(),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              color: Colors.grey.withOpacity(.5),
              height: 120 * 24,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: List.generate(
                        24,
                        (index) => SizedBox(
                          height: 120,
                          width: 100,
                          child: Text(
                            '${index.toString().padLeft(2, '0')}:00',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: LayoutBuilder(builder: (p0, p1) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        if (context
                                .watch<TimeTrackingViewModel>()
                                .items
                                .length >
                            context.watch<TimeTrackingViewModel>().dateSelected)
                          ...context
                              .watch<TimeTrackingViewModel>()
                              .items[context
                                  .watch<TimeTrackingViewModel>()
                                  .dateSelected]
                              .map((e) => TimeTrackingItem(
                                    timeEntity: e,
                                    width: p1.maxWidth,
                                  ))
                              .toList(),
                        Column(
                          children: List.generate(
                              24,
                              (index) => Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                        border: index != 0
                                            ? const Border(
                                                top: BorderSide(
                                                    color: Colors.grey))
                                            : null),
                                  )),
                        ),
                      ],
                    );
                  }))
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class TimeTrackingItem extends StatelessWidget {
  final TimeEntity timeEntity;
  final double? width;
  const TimeTrackingItem({super.key, required this.timeEntity, this.width});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (timeEntity.start.hour * 60 + timeEntity.start.minute) * 2,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                left: BorderSide(
              width: 5,
              color: timeEntity.project.color,
            ))),
        height: ((timeEntity.end.hour - timeEntity.start.hour) * 60 +
                (timeEntity.end.minute - timeEntity.start.minute)) *
            2,
        clipBehavior: Clip.hardEdge,
        width: width,
        child: Wrap(
          children: [
            SizedBox(
              width: width,
              child: Text(
                timeEntity.project.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              timeEntity.taskName,
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            Text(
              timeEntity.note,
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class DayCard extends StatelessWidget {
  final bool isSelected;
  final DateTime day;

  const DayCard({super.key, required this.isSelected, required this.day});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<TimeTrackingViewModel>().selectDay(day.weekday);
      },
      child: Container(
        decoration: BoxDecoration(
          border: context.read<TimeTrackingViewModel>().isToday(day)
              ? Border.all(color: Colors.green)
              : null,
          color: isSelected ? Colors.green : Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(children: [
          Text(
            DateFormat('EEE').format(day),
            style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : context.read<TimeTrackingViewModel>().isToday(day)
                        ? Colors.black
                        : Colors.grey,
                fontSize: 16),
          ),
          Text(
            day.day.toString(),
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black, fontSize: 20),
          )
        ]),
      ),
    );
  }
}
