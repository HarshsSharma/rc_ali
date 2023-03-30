import 'package:flutter/material.dart';

class ListViewWithTab extends StatelessWidget {
  final Widget Function(BuildContext, int) listItem;
  final VoidCallback? onTap;
  final int length;
  const ListViewWithTab(
      {super.key, required this.listItem, this.onTap, required this.length});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: onTap,
          child: listItem(context, index),
        );
      },
    );
  }
}
