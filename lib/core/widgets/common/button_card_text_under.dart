import 'package:expense_tracker/core/widgets/common/card_image.dart';
import 'package:expense_tracker/data/sharedpref/shared_preference_color.dart';
import 'package:flutter/material.dart';

class ButtonCardTextUnder extends StatelessWidget {
  final Text buttonText;
  final String imagePath;
  final VoidCallback? onTap;
  final Size? size; // Only use height, width is fitcontent as default

  const ButtonCardTextUnder({
    super.key,
    required this.buttonText,
    required this.imagePath,
    this.onTap,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = ImageColorStore().getAveriColorLightest(imagePath);
    double size = this.size?.height ?? 40.0;
    double padding = 8.0;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: 
        [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: padding,
              vertical: padding),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child:
              CardImageSquare(
                imagePath: imagePath,
                autoBackground: true,
                onTap: onTap,
                size: Size(size, size),
              )
            ),
          const SizedBox(height: 4),
          Center(child: buttonText),
        ],
      ) 
    );
  }
}
