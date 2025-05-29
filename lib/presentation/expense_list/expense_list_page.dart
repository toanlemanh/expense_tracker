import 'package:flutter/material.dart';

class ExpenseListPage extends StatelessWidget {
  const ExpenseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = PrimaryScrollController.of(context);

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: 20,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.shopping_cart),
        title: Text('Expense Item #$index'),
        subtitle: const Text("Detail info here..."),
        trailing: const Text("- \$100"),
      ),
    );
  }
}