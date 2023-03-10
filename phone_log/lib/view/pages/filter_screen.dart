import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/constant/app_colors.dart';
import '../widget/section_container.dart';
import '../widget/section_details.dart';
import 'edit_bulk.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late TextEditingController _fromController;
  late TextEditingController _toController;
  @override
  void initState() {
    _fromController = TextEditingController();
    _toController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        backgroundColor: AppColors.scaffoldBG,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Filter Log',
          style: TextStyle(color: AppColors.white, fontSize: 22),
        ),
        leadingWidth: 80,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () {},
              child: const Text(
                'Cancel',
                style: TextStyle(color: AppColors.white, fontSize: 18),
              )),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Save',
                style: TextStyle(color: AppColors.white, fontSize: 18),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      child: DateTextField(
                    fromController: _fromController,
                    label: 'Date From',
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: DateTextField(
                    label: 'Date To',
                    fromController: _toController,
                  )),
                ],
              ),
            ),
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

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }
}

class DateTextField extends StatelessWidget {
  const DateTextField({
    super.key,
    required TextEditingController fromController,
    required String label,
  })  : _label = label,
        _fromController = fromController;

  final TextEditingController _fromController;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () => showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 100)),
              lastDate: DateTime.now())
          .then((value) {
        if (value != null) {
          _fromController.text = DateFormat('dd-MM-y').format(value);
        }
      }),
      controller: _fromController,
      readOnly: true,
      decoration: InputDecoration(
          label: Text(_label),
          suffixIcon: const Icon(Icons.date_range_outlined)),
    );
  }
}
