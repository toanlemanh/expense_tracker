import 'package:expense_tracker/data/sharedpref/shared_preference_color.dart';
import 'package:flutter/material.dart';

class CardImageSquare extends StatelessWidget {
  final String imagePath;
  final bool autoBackground;
  final VoidCallback? onTap;

  const CardImageSquare({
    super.key,
    required this.imagePath,
    this.autoBackground = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = autoBackground
        // ? ImageColorStore().getAveriColor(imagePath)
        // ? ImageColorStore().getAveriColorLighter(imagePath)
        ? ImageColorStore().getAveriColorLighterLighter(imagePath)
        : Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: color,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            imagePath,
            width: 48,
            height: 48,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
