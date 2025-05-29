import 'package:flutter/material.dart';

class ExpenseStatisticPage extends StatelessWidget {
  const ExpenseStatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.pie_chart, size: 100, color: Colors.deepOrange),
          const SizedBox(height: 20),
          const Text(
            'Spending Breakdown',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text('A static summary of your expenses by category.'),
        ],
      ),
    );
  }
}
