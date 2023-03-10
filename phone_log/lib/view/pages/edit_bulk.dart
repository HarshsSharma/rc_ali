import 'package:flutter/material.dart';
import 'package:phone_log/core/constant/app_colors.dart';
import 'package:phone_log/view/widget/section_container.dart';

import '../widget/section_details.dart';

class EditBulk extends StatelessWidget {
  const EditBulk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        backgroundColor: AppColors.scaffoldBG,
        leadingWidth: 80,
        centerTitle: true,
        title: const Text(
          'Bulk Edit',
        ),
        leading: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () {},
              child: const Text('cancel',
                  style: TextStyle(color: AppColors.white))),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child:
                  const Text('save', style: TextStyle(color: AppColors.white))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionsContainer(title: 'Status'.toUpperCase()),
            SectionDetails(
              list: statusTypes,
              onTap: () {},
            ),
            SectionsContainer(title: 'piriorty'.toUpperCase()),
            SectionDetails(
              list: piriorty,
              onTap: () {},
            ),
            SectionsContainer(title: 'category'.toUpperCase()),
            SectionDetails(
              list: categories,
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 50),
                            elevation: 0,
                            backgroundColor: AppColors.darkGrey),
                        onPressed: () {},
                        child: Text('Cancel'.toUpperCase()),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 50),
                            elevation: 0,
                            backgroundColor: AppColors.babyBlue),
                        onPressed: () {},
                        child: Text('Save'.toUpperCase()),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

const List<String> statusTypes = [
  'new',
  'called again',
  'future call',
  'left word',
  'completed',
  'removed',
];
const List<String> categories = [
  'category 1',
  'category 2',
  'category 3',
];
const List<String> piriorty = [
  'low',
  'medium',
  'high',
];
