import 'package:expense_tracker/data/sharedpref/shared_preference_color.dart';
import 'package:flutter/material.dart';

class CardImageSquareBorder extends StatelessWidget {
  final String         imagePath;
  final bool           autoBackground;
  final Size?          size; // Only use height, width is the same as height
  final double?        elevation;
  final VoidCallback?  onTap;
  final Color?         borderColor;

  static const double _defaultSize = 48.0;

  const CardImageSquareBorder({
    super.key,
    required this.imagePath,
    this.autoBackground = false,
    this.size,
    this.elevation,
    this.onTap,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final double squareSize    = size?.height ?? _defaultSize;
    final double cardElevation = elevation    ?? 0.0;
    final Color borderColor   = this.borderColor ?? Colors.transparent;

    final color = autoBackground
        ? ImageColorStore().getAveriColorLighter1(imagePath)
        : Colors.white;

    return Material(
      color: color,
      elevation: cardElevation,
      borderRadius: BorderRadius.circular(16),
      child: Container(
      padding: const EdgeInsets.all(4.0), // Padding for border
      decoration: BoxDecoration(
        border: Border.all(
        color: borderColor,
        width: 2.0,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width:  squareSize + 24, // Adjusted for padding
        height: squareSize + 24,
        child: Center(
        child: Image.asset(
          imagePath,
          width: squareSize,
          height: squareSize,
          fit: BoxFit.contain,
        ),
        ),
      ),
      ),
    );
  }
}
