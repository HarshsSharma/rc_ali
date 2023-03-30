import 'package:flutter/material.dart';

class Expandable extends StatefulWidget {
  final Widget collapseWidget;
  final Widget expandedWidget;
  final VoidCallback? onTap;
  const Expandable(
      {super.key,
      required this.collapseWidget,
      required this.expandedWidget,
      this.onTap});

  @override
  State<Expandable> createState() => _ExbanableState();
}

class _ExbanableState extends State<Expandable> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
            if (widget.onTap != null) {
              widget.onTap!();
            }
          },
          child: widget.collapseWidget,
        ),
        if (_expanded) widget.expandedWidget,
      ],
    );
  }
}
