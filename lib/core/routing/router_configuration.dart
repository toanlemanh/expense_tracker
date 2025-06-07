import 'package:expense_tracker/core/widgets/pop_up_page.dart';
import 'package:expense_tracker/presentation/layout/category_page.dart';
import 'package:expense_tracker/presentation/layout/ledger_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import 'app_routes.dart';

final routerConfigurations = GoRouter(
  // navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home.path,
  routes: [
    // ShellRoute(
    // builder: (context, state, child) {
    //   return MainScaffold(child: child);
    // },
    // ),
    // routes:[
    //   GoRoute(
    //     path: AppRoutes.home.path,
    //     name: AppRoutes.home.name,
    //     builder: (context, state) => SingleScrollableSheet(child: ExpenseListPage()),
    //   ),

    // ]),
    GoRoute(
      path: AppRoutes.home.path,
      name: AppRoutes.home.name,
      builder: (context, state) {
        return MainScaffold();
      },
    ),

    GoRoute(
      path: AppRoutes.ledgers.path,
      name: AppRoutes.ledgers.name,
      pageBuilder:
          (context, state) => CustomTransitionPage(
            child: LedgerPage(),
            transitionsBuilder: _buildTransitionAnimation,
          ),
    ),
    GoRoute(
      path: AppRoutes.category.path,
      name: AppRoutes.category.name,
      pageBuilder:
          (context, state) => CustomTransitionPage(
            child: CategoryPage(),
            transitionsBuilder: _buildTransitionAnimation,
          ),
    ),
    GoRoute(
      path: AppRoutes.bookmarks.path,
      name: AppRoutes.bookmarks.name,
      pageBuilder:
          (context, state) => CustomTransitionPage(
            child: PopUpPage(child: const Text('Bookmarks page')),
            transitionsBuilder: _buildTransitionAnimation,
          ),
    ),
  ],
);

Widget _buildTransitionAnimation(
  context,
  animation,
  secondaryAnimation,
  child,
) {
  const begin = Offset(0, 1); // từ dưới lên
  const end = Offset.zero;
  const curve = Curves.ease;

  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  final offsetAnimation = animation.drive(tween);
  return SlideTransition(position: offsetAnimation, child: child);
}
