import 'package:flutter/material.dart';

class ListViewSelection extends StatefulWidget {
  final Function(int index)? onTap;
  final VoidCallback? afteDissmis;
  final int listLength;
  final Color selectedColor;
  final Color color;
  final Function(int index)? afterSelect;
  final Function(int index)? afterUnSelect;
  final Widget listItem;
  const ListViewSelection(
      {super.key,
      this.onTap,
      required this.listLength,
      required this.selectedColor,
      this.color = Colors.white,
      required this.listItem,
      this.afterSelect,
      this.afterUnSelect,
      this.afteDissmis});

  @override
  State<ListViewSelection> createState() => _ListViewSelectionState();
}

class _ListViewSelectionState extends State<ListViewSelection> {
  final List<int> _selectedIndices = [];
  bool inSelectionMode = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (inSelectionMode) {
          inSelectionMode = false;
          _selectedIndices.clear();
          setState(() {});
          if (widget.afteDissmis != null) {
            widget.afteDissmis!();
          }

          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: ListView.builder(
        itemCount: widget.listLength,
        itemBuilder: (context, index) {
          return InkWell(
            onLongPress: () {
              if (inSelectionMode) {
                return;
              } else {
                inSelectionMode = true;
                _selectedIndices.add(index);
                setState(() {});
                if (widget.afterUnSelect != null) {
                  widget.afterUnSelect!(index);
                }
              }
            },
            onTap: widget.onTap != null
                ? () {
                    if (inSelectionMode) {
                      widget.onTap!(index);

                      if (_selectedIndices.contains(index)) {
                        _selectedIndices.remove(index);
                        setState(() {});
                        if (widget.afterUnSelect != null) {
                          widget.afterUnSelect!(index);
                        }
                      } else {
                        _selectedIndices.add(index);
                        setState(() {});
                        if (widget.afterUnSelect != null) {
                          widget.afterUnSelect!(index);
                        }
                      }
                    }
                  }
                : null,
            child: Container(
              padding: const EdgeInsets.all(50),
              color: _selectedIndices.contains(index)
                  ? widget.selectedColor
                  : widget.color,
              child: widget.listItem,
            ),
          );
        },
      ),
    );
  }
}
