import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_log/controller/layout_view_model.dart';
import 'package:phone_log/core/constant/app_colors.dart';
import 'package:phone_log/core/router.dart';
import 'package:phone_log/view/widget/bottom_navigation_item.dart';
import 'package:provider/provider.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LayoutViewModel>(
        builder: (context, value, child) =>
            SafeArea(child: value.layoutViews[value.currentLayoutIndex]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: AppColors.babyBlue,
          elevation: 15,
          onPressed: () {
            Navigator.pushNamed(context, AppRouterNames.addNewEntry);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.borderGrey)),
          color: AppColors.white,
        ),
        child: Consumer<LayoutViewModel>(
          builder: (context, value, child) => Row(
            children: [
              BottomNavigationItem(
                  isActive: value.currentLayoutIndex == 0,
                  icon: CupertinoIcons.phone,
                  activeIcon: CupertinoIcons.phone_fill,
                  onTap: () {
                    value.changeCurrentLayoutIndex(0);
                  }),
              BottomNavigationItem(
                  isActive: value.currentLayoutIndex == 1,
                  icon: CupertinoIcons.person,
                  activeIcon: CupertinoIcons.person_fill,
                  onTap: () {
                    value.changeCurrentLayoutIndex(1);
                  }),
              const Spacer(),
              BottomNavigationItem(
                  isActive: value.currentLayoutIndex == 2,
                  icon: Icons.notifications_outlined,
                  activeIcon: Icons.notifications,
                  onTap: () {
                    value.changeCurrentLayoutIndex(2);
                  }),
              BottomNavigationItem(
                  isActive: value.currentLayoutIndex == 3,
                  icon: CupertinoIcons.settings,
                  activeIcon: Icons.settings,
                  onTap: () {
                    value.changeCurrentLayoutIndex(3);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
