import 'package:expense_tracker/core/widgets/common/card_image.dart';
import 'package:expense_tracker/data/sharedpref/shared_preference_color.dart';
import 'package:flutter/material.dart';

class ButtonCardText extends StatelessWidget {
  final Text buttonText;
  final String imagePath;
  final VoidCallback? onTap;
  final Size? size;

  const ButtonCardText({
    super.key,
    required this.buttonText,
    required this.imagePath,
    this.onTap,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = ImageColorStore().getAveriColorLightest(imagePath);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size?.width,
        height: size?.height,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: size == null ? MainAxisSize.min : MainAxisSize.max,
          children: [
            // Icon/Image
            CardImageSquare(
              imagePath: imagePath,
              autoBackground: true,
              onTap: onTap,
            ),
            const SizedBox(width: 8),
            // Text
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buttonText
              ],
            ),
          ],
        ),
      ),
    );
  }
}
