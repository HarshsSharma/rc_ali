import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:phone_log/core/components/tap_bar.dart';
import 'package:phone_log/individual_pages/time_tracking/view/widget/absence_item.dart';

class AbsenseScreen extends StatelessWidget {
  const AbsenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff161652),
        toolbarHeight: kToolbarHeight,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
        title: const Text('Absences'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Column(
        children: [
          CustomTapBar(
            children: [
              TabBarItem('Today', 10),
              TabBarItem('Upcoming', 22),
              TabBarItem('Holidays', 1),
            ],
            onChanged: (value) {
              log(value.toString());
            },
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return AbsenceItem();
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 20))
        ],
      ),
    );
  }
}
