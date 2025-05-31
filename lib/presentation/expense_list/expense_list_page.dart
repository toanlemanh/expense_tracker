import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:expense_tracker/core/widgets/transaction_record.dart';
import 'package:flutter/material.dart';

final items = [
  'shoes',
  'lemon',
  'apple',
  'shoes1',
  'lemon1',
  'apple1',
  'shoes2',
  'lemon2',
  'apple2',
  'shoes3',
  'lemon3',
  'apple3',
];
final colors = [
  0xFFC7E9E8,
  0xff45e0fc,
  0xFFC7E9E8,
  0xff45e0fc,
  0xFFC7E9E8,
  0xff45e0fc,
  0xFFC7E9E8,
  0xff45e678,
  0xFFC7E9E8,
  0xff45e456,
  0xFFC7E9E8,
  0xff45e0dc,
];

class ExpenseListPage extends StatelessWidget {
  const ExpenseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "May 27",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: appColors['background'],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text('Tue'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'JetBrainsMono',
                          fontWeight: FontWeight.bold,
                          color: appColors['astrograniteDebris'],
                        ),
                        children: [
                          TextSpan(text: '+0'),
                          WidgetSpan(child: SizedBox(width: 10)),
                          TextSpan(
                            text: '-250000',
                            style: TextStyle(
                              color: appColors['fuzzyWuzzyBrown'],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Constrain the ListView to avoid unbounded height in Column
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder:
                (context, index) => TransactionRecord(
                  title: items[index],
                  itemColor: colors[index],
                ),
          ),
        ),
      ],
    );
  }
}

//  ListView.builder(
    //   controller: scrollController,
    //   padding: const EdgeInsets.all(16),
    //   itemCount: 20,
    //   itemBuilder: (context, index) => ListTile(
    //     leading: const Icon(Icons.shopping_cart),
    //     title: Text('Expense Item #$index'),
    //     subtitle: const Text("Detail info here..."),
    //     trailing: const Text("- \$100"),
    //   ),
    // );
