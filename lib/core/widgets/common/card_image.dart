import 'package:expense_tracker/data/sharedpref/shared_preference_color.dart';
import 'package:flutter/material.dart';

class CardImageSquare extends StatelessWidget {
  final String         imagePath;
  final bool           autoBackground;
  final Size?          size; // Only use height, width is the same as height
  final double?        elevation;
  final VoidCallback?  onTap;

  static const double _defaultSize = 48.0;

  const CardImageSquare({
    super.key,
    required this.imagePath,
    this.autoBackground = false,
    this.size,
    this.elevation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double squareSize    = size?.height ?? _defaultSize;
    final double cardElevation = elevation    ?? 0.0;

    final color = autoBackground
        ? ImageColorStore().getAveriColorLighter1(imagePath)
        : Colors.white;

    return Material(
      color: color,
      elevation: cardElevation,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width:  squareSize + 32, // 16 padding on both sides
          height: squareSize + 32,
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
