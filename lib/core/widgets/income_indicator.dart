import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class IncomeIndicator extends StatelessWidget {
  const IncomeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: 'May Income',
                style: TextStyle(fontSize: 20, color: appColors['astrograniteDebris']),
                children: [
                  WidgetSpan(
                    child: Icon(Icons.arrow_downward, size: 18, color: appColors['fuzzyWuzzyBrown']),
                  ),
                ],
              ),
            ),

            RichText(
              text: TextSpan(
                text: '0',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: appColors['astrograniteDebris'],
                ),
                children: [
                  TextSpan(
                    text: 'VND',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
