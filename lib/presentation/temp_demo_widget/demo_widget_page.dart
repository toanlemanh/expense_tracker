import 'package:expense_tracker/core/widgets/common/button_card_text.dart';
import 'package:expense_tracker/core/widgets/common/card_image.dart';
import 'package:flutter/material.dart';

class DemoWidgetPage extends StatelessWidget {
  const DemoWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Đề mô quít chét (s)'),
          const ButtonCardText(title: 'Ấn đê',
                imagePath: 'assets/icons/categories/png/Car.png'),
          const CardImageSquare(
            imagePath: 'assets/icons/categories/png/Car.png',
            autoBackground: true,
          ),
        ],
      ),
    );
  }
}
