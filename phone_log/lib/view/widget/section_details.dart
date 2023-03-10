import 'package:flutter/material.dart';

import '../../core/constant/app_colors.dart';

class SectionDetails extends StatelessWidget {
  final List<String> list;
  final VoidCallback onTap;
  const SectionDetails({
    super.key,
    required this.list,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        children: list
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          shadowColor: Colors.white,
                          splashFactory: NoSplash.splashFactory,
                          fixedSize: Size(
                              (MediaQuery.of(context).size.width - 70) / 3, 40),
                          side: BorderSide(
                              color: list.indexOf(e) == 0
                                  ? AppColors.babyBlue
                                  : AppColors.borderGrey,
                              width: 2),
                          elevation: 0,
                          backgroundColor: list.indexOf(e) == 0
                              ? AppColors.overlayBlue
                              : Colors.white,
                        ),
                        onPressed: onTap,
                        child: FittedBox(
                          child: Text(
                            e.toUpperCase(),
                            style: const TextStyle(color: AppColors.black),
                          ),
                        )),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
