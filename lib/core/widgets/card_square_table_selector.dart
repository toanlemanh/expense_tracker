import 'package:expense_tracker/core/widgets/common/card_image_border.dart';
import 'package:flutter/material.dart';

// TODO: NOT DONE, FINISH
class CardSquareTableSelector extends StatelessWidget {
  final List<String> imagePaths;
  final int selectedIndex;
  final ValueChanged<int>? onItemSelected;

  const CardSquareTableSelector({
    super.key,
    required this.imagePaths,
    this.selectedIndex = -1,
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: imagePaths.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onItemSelected?.call(index),
          child: CardImageSquareBorder(
            imagePath: imagePaths[index],
            autoBackground: true,
            size: const Size(48, 48),
            borderColor: selectedIndex == index
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
          ),
        );
      },
    );
  }
}
