import 'package:flutter/material.dart';
import 'package:phone_log/core/components/tap_bar.dart';
import 'package:phone_log/individual_pages/time_tracking/view/add_time_off.dart';
import 'package:phone_log/individual_pages/time_tracking/view/time_off_req.dart';
import 'package:phone_log/individual_pages/time_tracking/view/widget/absence_item.dart';
import 'package:phone_log/individual_pages/time_tracking/view/widget/time_off_item.dart';

class TimeOff extends StatefulWidget {
  const TimeOff({super.key});

  @override
  State<TimeOff> createState() => _TimeOffState();
}

class _TimeOffState extends State<TimeOff> {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff161652),
        toolbarHeight: kToolbarHeight,
        title: const Text('Time Off'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Column(
        children: [
          CustomTapBar(
            children: [
              TabBarItem(label: 'My Time Off'),
              TabBarItem(label: 'Time Off Requests'),
            ],
            onChanged: (value) {
              setState(() {
                tab = value;
              });
            },
          ),
          if (tab == 0)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                  const Text(
                    '2023',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {}),
                ],
              ),
            ),
          if (tab == 0)
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xffF6F6F6),
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Color(0xffE3E3E3)))),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: holidayTypes
                    .map((e) => Expanded(
                            child: Text(
                          e,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff676A6C),
                              fontWeight: FontWeight.bold),
                        )))
                    .toList(),
              ),
            ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return tab == 0
                        ? const TimeOffItem()
                        : AbsenceItem(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TimeOffRequests(),
                                )),
                          );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: 20))
        ],
      ),
      floatingActionButton: tab == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddTimeOff(),
                    ));
              },
              backgroundColor: const Color(0xff161652),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

List<String> holidayTypes = [
  '- BT',
  '0/2 SD',
  '- BN',
  '- OT',
  '5.5/25 HD',
];
