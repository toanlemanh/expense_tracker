import 'package:expense_tracker/core/widgets/common/default_widgets.dart';
import 'package:flutter/material.dart';

class SingleChoiceSegmentedSelector extends StatefulWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? selectedColor;

  const SingleChoiceSegmentedSelector({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
    this.textStyle,
    this.backgroundColor,
    this.selectedColor,
  });

  @override
  State<SingleChoiceSegmentedSelector> createState() 
    => _SingleChoiceSegmentedSelectorState();
}

class _SingleChoiceSegmentedSelectorState 
    extends State<SingleChoiceSegmentedSelector> {

  late int selectedIndex;
  Color?     get backgroundColor => widget.backgroundColor ?? DefaultWidget.backgroundColor;
  Color?     get selectedColor   => widget.selectedColor   ?? Colors.white;
  TextStyle? get textStyle       => widget.textStyle       ?? DefaultWidget.textStyle;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  void _handleTap(int index) {
    if (index == selectedIndex) return; // Do nothing
    setState(() {
      selectedIndex = index;
    });
    widget.onChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.options.length, (index) {
          final bool isSelected = index == selectedIndex;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: GestureDetector(
              onTap: () => _handleTap(index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? selectedColor : backgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  widget.options[index],
                  style: textStyle,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
