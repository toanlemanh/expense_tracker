import 'package:expense_tracker/core/widgets/expense_indicator.dart';
import 'package:expense_tracker/core/widgets/income_indicator.dart';
import 'package:flutter/material.dart';
class MainIndicatorSection extends StatelessWidget{
  MainIndicatorSection({super.key});

  @override
  Widget build(BuildContext context){
    return Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'assets/icons/tungtungtungsahur.png',
                    width: 120, // control size to avoid cropping
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Section cho Expense
                  ExpenseIndicator(),
                  const SizedBox(width: 10),
                  //Section cho Income
                  IncomeIndicator(),
                ],
              ),
            ],
          );
  }
}