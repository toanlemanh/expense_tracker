import 'package:expense_tracker/features/wallet/viewmodel/wallet_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'core/routing/router_configuration.dart';

void main() async {
  
  
  runApp(
    MultiProvider(providers: [
      Provider<WalletStore>(
        create: (_) => WalletStore(),
        lazy: false, // comment cái này để disable lazy loading 
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: routerConfigurations, // router này ánh xạ sang route_configuration  
    );
  }
}

//widget (layout của appa) này bao gồm AppBar, Body và BottomNavigationBar
// body thì chứa các screen khác nhau, BottomNavigationBar thì dùng để điều hướng giữa các screen
class MainScaffold extends StatelessWidget {
  final Widget child;
  const MainScaffold({required this.child, super.key});

// hàm này dùng để lấy index của 1 screen dựa vào đường dẫn hiện tại
  int _getIndex(BuildContext context) {

   final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(AppRoutes.home.path)) {
      return 0;
    }
    else if (location.startsWith(AppRoutes.wallet.path)) {
      return 1;
    }
    else if (location.startsWith(AppRoutes.setting.path)) {
      return 2;
    }
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    final destinations = [
      AppRoutes.home.path,
      AppRoutes.wallet.path,
      AppRoutes.setting.path,
    ];
    // điều hướng sang các trang khác nhờ vào index 
    context.go(destinations[index]);
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getIndex(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          backgroundColor: Colors.deepPurple,
        ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onTap(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      )
    );
  }
}
