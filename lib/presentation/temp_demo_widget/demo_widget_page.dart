import 'package:expense_tracker/core/widgets/common/button_card_text.dart';
import 'package:expense_tracker/core/widgets/common/button_card_text_under.dart';
import 'package:expense_tracker/core/widgets/common/card_image.dart';
import 'package:expense_tracker/core/widgets/common/segmented_selector.dart';
import 'package:expense_tracker/core/widgets/common/text_input_rounded.dart';
import 'package:flutter/material.dart';

class DemoWidgetPage extends StatelessWidget {
  const DemoWidgetPage({super.key});

  void _testOnTap() {
    debugPrint("tapped!");
  }

  @override
  Widget build(BuildContext context) {
    List<String> categoryOptions = ['Expenses', 'Income', 'Transfer'];
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Đề mô quít chét (s)'),
          ButtonCardText( buttonText: Text('Button Card Text'),
                          imagePath: 'assets/icons/categories/png/Car.png',
                          onTap: _testOnTap
                        ),
          CardImageSquare(
            imagePath: 'assets/icons/categories/png/Car.png',
            autoBackground: true,
            onTap: _testOnTap,
          ),
          ButtonCardTextUnder(
            imagePath: 'assets/icons/categories/png/Avacado.png',
            onTap: _testOnTap,
            buttonText: const Text('Ledger'),
          ),
          TextInputRounded(
            controller: TextEditingController(),
            hintText: 'Enter your text here',
            onChanged: (value) {
              debugPrint('Text changed: $value');
            },
            backgroundColor: const Color(0xFFFDF1DD),
          ),
          SingleChoiceSegmentedSelector(
            options: categoryOptions,
            selectedIndex: 0,
            onChanged: (index) {
              debugPrint('Category changed: ${categoryOptions[index]}');
            },
          )
        ],
      ),
    );
  }
}
