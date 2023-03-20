import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:phone_log/individual_pages/time_tracking/controller/time_tracking_controller.dart';
import 'package:phone_log/individual_pages/time_tracking/model/time_tracking_model.dart';
import 'package:phone_log/individual_pages/time_tracking/view/add_time_entry.dart';
import 'package:provider/provider.dart';

class TimeTracking extends StatefulWidget {
  const TimeTracking({super.key});

  @override
  State<TimeTracking> createState() => _TimeTrackingState();
}

class _TimeTrackingState extends State<TimeTracking> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    SchedulerBinding.instance.addPostFrameCallback((_) => context
        .read<TimeTrackingViewModel>()
        .goToTheCurrentTime(_scrollController));

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff161652),
        toolbarHeight: kToolbarHeight,
        title: const Text('Time Tracking'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
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
              child: ListView(
            controller: _scrollController,
            children: [
              Container(
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${index.toString().padLeft(2, '0')}:00',
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                const Spacer(),
                                Text(
                                  '${index.toString().padLeft(2, '0')}:30',
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: LayoutBuilder(builder: (p0, p1) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
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
                          if (context
                                  .watch<TimeTrackingViewModel>()
                                  .items
                                  .length >=
                              context
                                  .watch<TimeTrackingViewModel>()
                                  .dateSelected)
                            ...context
                                .watch<TimeTrackingViewModel>()
                                .items[context
                                        .watch<TimeTrackingViewModel>()
                                        .dateSelected -
                                    1]
                                .map((e) => TimeTrackingItem(
                                      timeEntity: e,
                                      width: p1.maxWidth,
                                    ))
                                .toList(),
                          Positioned(
                            top: (TimeOfDay.now().hour * 60 +
                                    TimeOfDay.now().minute) *
                                2.0,
                            child: Row(
                              children: [
                                Container(
                                  width: p1.maxWidth,
                                  height: 3,
                                  color: Colors.green,
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    }))
                  ],
                ),
              )
            ],
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTimeEntity(
                  dateTime: context.read<TimeTrackingViewModel>().currentDate,
                ),
              ));
        },
        backgroundColor: const Color(0xff161652),
        child: const Icon(Icons.add),
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
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              width: width,
              child: Text(
                timeEntity.project.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                timeEntity.taskName,
                style: const TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            Text(
              timeEntity.note,
              style: const TextStyle(color: Colors.grey, fontSize: 20),
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
        context.read<TimeTrackingViewModel>().selectDay(day.weekday, day);
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
