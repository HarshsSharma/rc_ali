import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/extinsions/media_query.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff161652),
        toolbarHeight: kToolbarHeight,
        title: const Text('Dashboard'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            DashboardContainer(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.emergency_sharp,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Time Tracking Stats',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  TimeStatsItem(
                    hours: '6',
                    mins: '40',
                    label: 'Today',
                    mainColor: Color(0xff14CB43),
                    secondColor: Color(0xff14CB43).withOpacity(.16),
                    target: '8',
                    widthFactor: (6 * 60 + 40) / (8 * 60),
                  ),
                  TimeStatsItem(
                    hours: '22',
                    mins: '05',
                    label: 'This week',
                    mainColor: Color(0xff505064),
                    secondColor: Color(0xff505064).withOpacity(.16),
                    target: '40',
                    widthFactor: (22 * 60 + 5) / (40 * 60),
                  ),
                  TimeStatsItem(
                    hours: '61',
                    mins: '50',
                    label: 'This month',
                    mainColor: Color(0xff505064),
                    secondColor: Color(0xff505064).withOpacity(.16),
                    target: '160',
                    widthFactor: (61 * 60 + 50) / (160 * 60),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Time Tracking Level',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                        style:
                            TextStyle(color: Color(0xff676A6C), fontSize: 16),
                      ),
                      Text(
                        'Very Good',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                        style:
                            TextStyle(color: Color(0xff14CB43), fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
            ),
            DashboardContainer(
                child: Column(
              children: [
                BankAcountsItem(
                  image: 'assets/images/bank.PNG',
                  label: 'Bank Accounts',
                  value: '€23,114,742.02',
                ),
                const SizedBox(height: 20),
                BankAcountsItem(
                  image: 'assets/images/rare.PNG',
                  label: 'Rare Crew - Slovakia',
                  value: '€23,114,742.02',
                ),
                const Divider(),
                BankAcountsItem(
                  image: 'assets/images/r.PNG',
                  label: 'Rapidd Technologies',
                  value: '€23,114,742.02',
                ),
                const Divider(),
                BankAcountsItem(
                  image: 'assets/images/rare.PNG',
                  label: 'Rare Crew - Serbia',
                  value: '€23,114,742.02',
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class BankAcountsItem extends StatelessWidget {
  final String image;
  final String value;
  final String label;
  const BankAcountsItem({
    super.key,
    required this.image,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: context.height * .04,
          height: context.height * .04,
        ),
        Text(
          label,
          textScaleFactor: ScaleSize.textScaleFactor(context),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const Spacer(),
        Text(
          value,
          textScaleFactor: ScaleSize.textScaleFactor(context),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class TimeStatsItem extends StatelessWidget {
  final String label;
  final String hours;
  final String mins;
  final String target;
  final double widthFactor;
  final Color mainColor;
  final Color secondColor;
  const TimeStatsItem({
    super.key,
    required this.label,
    required this.target,
    required this.widthFactor,
    required this.hours,
    required this.mins,
    required this.mainColor,
    required this.secondColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                label,
                textScaleFactor: ScaleSize.textScaleFactor(context),
                style: TextStyle(color: Color(0xff676A6C), fontSize: 16),
              ),
              const Spacer(),
              Text(
                '${hours}h ${mins}min',
                textScaleFactor: ScaleSize.textScaleFactor(context),
                style: TextStyle(fontSize: 16),
              ),
              Text(
                ' (${target}h)',
                textScaleFactor: ScaleSize.textScaleFactor(context),
                style: TextStyle(fontSize: 16, color: Color(0xff676A6C)),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                color: secondColor,
                height: 3,
              ),
              LayoutBuilder(builder: (context, cons) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 3,
                  width: widthFactor * cons.maxWidth,
                  color: mainColor,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class DashboardContainer extends StatelessWidget {
  final Widget child;
  const DashboardContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffE7EAEC)),
      ),
      child: child,
    );
  }
}
