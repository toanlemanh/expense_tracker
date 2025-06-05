import 'package:flutter/material.dart';

// TODO: NOT DONE, FINISH
class SingleChoiceSegmentedSelector extends StatefulWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const SingleChoiceSegmentedSelector({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  State<SingleChoiceSegmentedSelector> createState() 
    => _SingleChoiceSegmentedSelectorState();
}

class _SingleChoiceSegmentedSelectorState 
    extends State<SingleChoiceSegmentedSelector> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  void _handleTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFDF1DD),
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.options.length, (index) {
          final bool isSelected = index == selectedIndex;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () => _handleTap(index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : const Color(0xFFFDF1DD),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  widget.options[index],
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
