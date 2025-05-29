import 'package:expense_tracker/core/data/local/sqflite/sqflite_client.dart';
import 'package:expense_tracker/core/data/network/dio_client.dart';
import 'package:expense_tracker/features/asset/service/asset_service.dart';
import 'package:expense_tracker/features/asset/viewmodel/asset_store.dart';
import 'package:expense_tracker/presentation/expense_list/expense_list_page.dart';
import 'package:expense_tracker/presentation/layout/single_scrollable_sheet.dart';
import 'package:expense_tracker/presentation/statistic/money_statistic_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routing/router_configuration.dart';

void main() async {
  //init service 
  late final assetService = AssetService(dioClient: DioClient(), sqfliteClient: SqfliteClient());
  
  runApp(
    MultiProvider(providers: [
      Provider<AssetStore>(
        create: (_) => AssetStore(assetService),
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
class MainScaffold extends StatefulWidget {

  // hàm này dùng để lấy index của 1 screen dựa vào đường dẫn hiện tại
  // int _getIndex(BuildContext context) {

  //  final location = GoRouterState.of(context).uri.toString();
  //   if (location.startsWith(AppRoutes.home.path)) {
  //     return 0;
  //   }
  //   else if (location.startsWith(AppRoutes.wallet.path)) {
  //     return 1;
  //   }
  //   else if (location.startsWith(AppRoutes.setting.path)) {
  //     return 2;
  //   }
  //   return 0;
  // }

  // void _onTap(BuildContext context, int index) {
  //   final destinations = [
  //     AppRoutes.home.path,
  //     AppRoutes.wallet.path,
  //     AppRoutes.setting.path,
  //   ];
  //   // điều hướng sang các trang khác nhờ vào index 
  //   context.go(destinations[index]);
  // }

  final Widget child;
  const MainScaffold({required this.child, super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold>
  with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFDEBD0),
      body: Stack(
        children: [
          // Top bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.3,
            child: _buildTopBar(),
          ),

          PageView(
            scrollDirection: Axis.horizontal,
          children: [
              SingleScrollableSheet(
                child: ExpenseListPage(),
              ),
              SingleScrollableSheet(
                child: ExpenseStatisticPage(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Chip(label: Text("Default ledger")),
            Chip(label: Text("Setup Budget")),
          ],
        ),
      ),
    );
  }
}


      // body: child,
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (index) => _onTap(context, index),
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
      //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      //   ],
      // ),