import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:expense_tracker/core/data/local/sqflite/sqflite_client.dart';
import 'package:expense_tracker/core/data/network/dio_client.dart';
import 'package:expense_tracker/core/routing/app_routes.dart';
import 'package:expense_tracker/core/widgets/bottom_navy_bar.dart';
import 'package:expense_tracker/core/widgets/expense_indicator.dart';
import 'package:expense_tracker/core/widgets/income_indicator.dart';
import 'package:expense_tracker/features/asset/service/asset_service.dart';
import 'package:expense_tracker/features/asset/viewmodel/asset_store.dart';
import 'package:expense_tracker/presentation/expense_list/expense_list_page.dart';
import 'package:expense_tracker/presentation/layout/single_scrollable_sheet.dart';
import 'package:expense_tracker/presentation/main_indicator_section/main_indicator_section.dart';
import 'package:expense_tracker/presentation/statistic/money_statistic_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'core/routing/router_configuration.dart';

void main() async {
  //init service
  late final assetService = AssetService(
    dioClient: DioClient(),
    sqfliteClient: SqfliteClient(),
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<AssetStore>(
          create: (_) => AssetStore(assetService),
          //lazy: false, // comment cái này để disable lazy loading
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appColors['background']!),
        fontFamily: 'JetBrainsMono',
      ),
      routerConfig:
          routerConfigurations, // router này ánh xạ sang route_configuration
    );
  }
}

//widget (layout của appa) này bao gồm AppBar, Body và BottomNavigationBar
// body thì chứa các screen khác nhau, BottomNavigationBar thì dùng để điều hướng giữa các screen
class MainScaffold extends StatefulWidget {
  // hàm này dùng để lấy index của 1 screen dựa vào đường dẫn hiện tại

  final Widget child;
  const MainScaffold({required this.child, super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // int _getIndex(BuildContext context) {
  //   final location = GoRouterState.of(context).uri.toString();
  //   if (location.startsWith(AppRoutes.home.path)) {
  //     return 0;
  //   } else if (location.startsWith(AppRoutes.wallet.path)) {
  //     return 1;
  //   } else if (location.startsWith(AppRoutes.setting.path)) {
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
  //   print('điều hướng sang các trang khác nhờ vào index');
  //   context.go(destinations[index]);
  // }

  @override
  Widget build(BuildContext context) {
    // final currentIndex = _getIndex(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: appColors['background']!,
      body: Stack(
        children: [
          // Top container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.3,
            child: _buildTopBar(),
          ),
          // Page content
          PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (int page) {
              setState(() => _currentIndex = page);
            },
            children: [
              SingleScrollableSheet(child: ExpenseListPage()),
              SingleScrollableSheet(child: ExpenseStatisticPage()),
              SingleScrollableSheet(child: ExpenseListPage()),
            ],
          ),
          // Floating BottomNavigationBar
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: appColors['pannel']!,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: BottomNavyBar(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                backgroundColor: appColors['pannel'],
                selectedIndex: _currentIndex,
                onItemSelected: (index) {
                  setState(() {
                    _currentIndex = index;
                    // pageController.jumpToPage(index);
                    pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  });
                },
                // containerHeight: 20,
                items: <BottomNavyBarItem>[
                  BottomNavyBarItem(
                    activeColor: appColors['astrograniteDebris']!,
                    inactiveColor: appColors['background'],
                    activeTextColor: appColors['astrograniteDebris'], //fallback color
                    //laays mau trung tinh
                    activeBackgroundColor: appColors['fuzzyWuzzyBrown']!,
                    icon: Image.asset(
                      'assets/icons/image.png',
                      width: 24,
                      height: 24,
                    ),
                    title: Center(child: Text('Home')),
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.wallet),
                    title: Center(child: Text('Wallet')),
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.settings),
                    title: Center(child: Text('Settings')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextButton(
                    child: Text(
                      "Default ledger",
                      style: TextStyle(fontSize: 16),
                    ),

                    onPressed: () {},
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextButton(
                    child: Text("Setup Budget", style: TextStyle(fontSize: 16)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          MainIndicatorSection(),
        ],
      ),
    );
  }
}
