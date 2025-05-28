import 'package:expense_tracker/features/home/view/home_screen.dart';
import 'package:expense_tracker/features/setting/view/setting_screen.dart';
import 'package:expense_tracker/features/wallet/view/wallet_screen.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import 'app_routes.dart';

final routerConfigurations = GoRouter(
  // navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home.path,
  routes: [
    ShellRoute(
    builder: (context, state, child) {
      return MainScaffold(child: child);
    },
    routes:[
      GoRoute(
        path: AppRoutes.home.path,
        name: AppRoutes.home.name,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.wallet.path,
        name: AppRoutes.wallet.name,
        builder: (context, state) => WalletScreen(),
      ),
      GoRoute(
        path: AppRoutes.setting.path,
        name: AppRoutes.setting.name,
        builder: (context, state) => SettingScreen(),
      ),
    ]),
  ],
); 
