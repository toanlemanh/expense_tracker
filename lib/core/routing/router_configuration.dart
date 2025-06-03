import 'package:expense_tracker/features/home/view/home_screen.dart';
import 'package:expense_tracker/features/setting/view/setting_screen.dart';
import 'package:expense_tracker/features/asset/view/wallet_screen.dart';
import 'package:expense_tracker/presentation/expense_list/expense_list_page.dart';
import 'package:expense_tracker/presentation/layout/single_scrollable_sheet.dart';
import 'package:expense_tracker/presentation/statistic/money_statistic_page.dart';
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
  ],
); 
