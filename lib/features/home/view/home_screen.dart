import 'package:expense_tracker/core/widgets/transaction_record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final items = ['shoes', 'lemon', 'apple', 'shoes1', 'lemon1', 'apple1', 'shoes2', 'lemon2', 'apple2', 'shoes3', 'lemon3', 'apple3'];
final colors = [0xFFC7E9E8, 0xff45e0fc, 0xFFC7E9E8, 0xff45e0fc, 0xFFC7E9E8, 0xff45e0fc, 0xFFC7E9E8, 0xff45e678, 0xFFC7E9E8, 0xff45e456, 0xFFC7E9E8, 0xff45e0dc];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => TransactionTile(title: items[index], itemColor: colors[index]),
    );
  }
}