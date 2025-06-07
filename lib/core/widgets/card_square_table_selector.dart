import 'package:expense_tracker/core/widgets/common/card_image_border.dart';
import 'package:expense_tracker/core/widgets/common/default_widgets.dart';
import 'package:flutter/material.dart';

class CardSquareTableSelector extends StatefulWidget {
  final List<String> imagePaths;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  final Size?  itemSize; // Only use height, width is the same as height
  final Color? unselectedBorderColor;
  final Color? selectedBorderColor;

  const CardSquareTableSelector({
    super.key,
    required this.imagePaths,
    this.selectedIndex = -1,
    required this.onItemSelected,
    this.unselectedBorderColor,
    this.selectedBorderColor,
    this.itemSize,
  });

  @override
  State<CardSquareTableSelector> createState() => _CardSquareTableSelectorState();
}

class _CardSquareTableSelectorState extends State<CardSquareTableSelector> {

  late int selectedIndex = widget.selectedIndex;

  void _handleTap(int index) {
    if (index == selectedIndex) return; // Do nothing
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }
  @override
  Widget build(BuildContext context) {

    Color selectedBorderColor   = widget.selectedBorderColor   ?? DefaultWidget.itemSelected;
    Color unselectedBorderColor = widget.unselectedBorderColor ?? DefaultWidget.itemUnselected;
    Size  itemSize              = widget.itemSize ?? const Size(64, 64);

    int   crossACount           = MediaQuery.of(context).size.width ~/ itemSize.height;

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:   crossACount,
        mainAxisSpacing:  12,
        crossAxisSpacing: 12,
      ),
      itemCount: widget.imagePaths.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final bool isSelected = (selectedIndex == index);
        return GestureDetector(
          onTap: () => _handleTap(index),
          child: CardImageSquareBorder(
            imagePath: widget.imagePaths[index],
            autoBackground: true,
            size: itemSize,
            borderColor: isSelected
                ? selectedBorderColor
                : unselectedBorderColor,
          ),
        );
      },
    );
  }
}
