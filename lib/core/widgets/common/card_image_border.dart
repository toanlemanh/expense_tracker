import 'package:expense_tracker/data/sharedpref/shared_preference_color.dart';
import 'package:flutter/material.dart';

class CardImageSquareBorder extends StatelessWidget {
  final String         imagePath;
  final bool           autoBackground;
  final Size?          size; // Only use height, width is the same as height
  final VoidCallback?  onTap;
  final Color?         borderColor;

  static const double _defaultSize = 48.0;

  const CardImageSquareBorder({
    super.key,
    required this.imagePath,
    this.autoBackground = false,
    this.size,
    this.onTap,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final double squareSize          = size?.height ?? _defaultSize;
    final Color effectiveBorderColor = borderColor  ?? Colors.transparent;
    final double outerSquareSize     = squareSize + 32;

    final backgroundColor = autoBackground
        ? ImageColorStore().getAveriColorLighter1(imagePath)
        : Colors.white;

    return Container(
      width:  outerSquareSize,
      height: outerSquareSize,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: effectiveBorderColor,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width:  squareSize,
            height: squareSize,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

}
