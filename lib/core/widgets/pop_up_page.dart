import 'package:expense_tracker/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class PopUpPage extends StatelessWidget {
  late final Widget child;
  PopUpPage({super.key, required this.child});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
            final router = GoRouter.of(context);
            if (router.canPop()) {
              router.pop();
            } else {
              router.goNamed(AppRoutes.home.name);
            }
            },
          padding: EdgeInsets.all(2.0),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('${GoRouterState.of(context).uri.toString()}'),
      ),
      body: child,
    );
  }
  
}