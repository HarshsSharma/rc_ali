import 'package:flutter/material.dart';

import '../model/time_tracking_model.dart';

class TimeTrackingViewModel extends ChangeNotifier {
  int dateSelected = DateTime.now().weekday;
  List<DateTime> getTheWeekDayes(DateTime d) {
    List<DateTime> dates = [];
    final start = d.subtract(Duration(days: d.weekday - 1));
    for (int i = 0; i < 7; i++) {
      dates.add(start.add(Duration(days: i)));
    }
    return dates;
  }

  void goToTheCurrentTime(ScrollController controller) {
    final now = TimeOfDay.now();
    final startOffset = (now.hour * 60 + now.minute) * 2.0;
    controller.animateTo(startOffset - 50,
        duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
  }

  List<List<TimeEntity>> items = [
    [
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.yellow),
        'note ' * 5,
        TimeOfDay.now(),
        const TimeOfDay(hour: 17, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.black),
        'note ' * 5,
        const TimeOfDay(hour: 8, minute: 30),
        const TimeOfDay(hour: 9, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.green),
        'note ' * 5,
        const TimeOfDay(hour: 12, minute: 30),
        const TimeOfDay(hour: 14, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.red),
        'note ' * 5,
        const TimeOfDay(hour: 20, minute: 0),
        const TimeOfDay(hour: 21, minute: 30),
      )
    ],
    [
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.yellow),
        'note ' * 5,
        const TimeOfDay(hour: 16, minute: 30),
        const TimeOfDay(hour: 17, minute: 30),
      ),
      TimeEntity(
        'Task Name New',
        Project('Project Name New', Colors.purple),
        'note ' * 5,
        const TimeOfDay(hour: 2, minute: 0),
        const TimeOfDay(hour: 3, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.green),
        'note ' * 5,
        const TimeOfDay(hour: 12, minute: 30),
        const TimeOfDay(hour: 14, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.red),
        'note ' * 5,
        const TimeOfDay(hour: 6, minute: 30),
        const TimeOfDay(hour: 8, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.green),
        'note ' * 5,
        const TimeOfDay(hour: 20, minute: 0),
        const TimeOfDay(hour: 21, minute: 30),
      )
    ],
    [
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.red),
        'note ' * 5,
        const TimeOfDay(hour: 0, minute: 0),
        const TimeOfDay(hour: 0, minute: 30),
      ),
      TimeEntity(
        'Task Name New',
        Project('Project Name New', Colors.purple),
        'note ' * 5,
        const TimeOfDay(hour: 2, minute: 0),
        const TimeOfDay(hour: 3, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.yellow),
        'note ' * 5,
        const TimeOfDay(hour: 4, minute: 30),
        const TimeOfDay(hour: 5, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.green),
        'note ' * 5,
        const TimeOfDay(hour: 9, minute: 30),
        const TimeOfDay(hour: 11, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.black),
        'note ' * 5,
        const TimeOfDay(hour: 15, minute: 0),
        const TimeOfDay(hour: 16, minute: 30),
      )
    ],
    [
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.green),
        'note ' * 5,
        const TimeOfDay(hour: 16, minute: 30),
        const TimeOfDay(hour: 17, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.yellow),
        'note ' * 5,
        const TimeOfDay(hour: 8, minute: 30),
        const TimeOfDay(hour: 9, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.red),
        'note ' * 5,
        const TimeOfDay(hour: 12, minute: 30),
        const TimeOfDay(hour: 14, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.black),
        'note ' * 5,
        const TimeOfDay(hour: 20, minute: 0),
        const TimeOfDay(hour: 21, minute: 30),
      )
    ],
  ];

  void selectDay(int index) {
    dateSelected = index;
    notifyListeners();
  }

  bool isToday(day) {
    return DateTime(day.year, day.month, day.day)
            .difference(DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day))
            .inDays ==
        0;
  }
}
