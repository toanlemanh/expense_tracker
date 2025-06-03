import 'package:expense_tracker/core/widgets/pop_up_page.dart';
import 'package:flutter/widgets.dart';

class CategoryPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    print('Category page');
    return PopUpPage(child: const Text('Category content'));
  }
}