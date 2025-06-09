import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:expense_tracker/core/data/local/sqflite/sqflite_client.dart';
import 'package:expense_tracker/core/data/network/dio_client.dart';
import 'package:expense_tracker/core/routing/app_routes.dart';
import 'package:expense_tracker/core/widgets/bottom_navy_bar.dart';
import 'package:expense_tracker/core/widgets/common/button_card_text.dart';
import 'package:expense_tracker/core/widgets/common/card_image.dart';
import 'package:expense_tracker/features/asset/service/asset_service.dart';
import 'package:expense_tracker/features/asset/viewmodel/asset_store.dart';
import 'package:expense_tracker/presentation/temp_demo_widget/demo_widget_page.dart';
import 'package:expense_tracker/data/sharedpref/shared_preference_color.dart';
import 'package:expense_tracker/features/record/service/record_service.dart';
import 'package:expense_tracker/features/record/viewmodel/record_store.dart';
import 'package:expense_tracker/presentation/main_indicator_section/main_indicator_section.dart';
import 'package:expense_tracker/presentation/layout/scrollable_page.dart';
import 'package:expense_tracker/presentation/expense_list/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'core/routing/router_configuration.dart';

final items = [
  'Shoes',
  'Lemon',
  'Apple',
  'Banana',
  'Hat',
  'Shirt',
  'Pants',
  'Watch',
  'Book',
  'Camera',
  'Glasses',
  'Backpack',
  'Wallet',
  'Bottle',
  'Laptop',
  'Phone',
  'Umbrella',
  'Towel',
];

final colors = [
  0xFFE57373, // Red
  0xFFFFB74D, // Orange
  0xFF81C784, // Green
  0xFF64B5F6, // Blue
  0xFFBA68C8, // Purple
  0xFF4DB6AC, // Teal
  0xFFFF8A65, // Deep Orange
  0xFFDCE775, // Lime
  0xFFA1887F, // Brown Grey
  0xFF90A4AE, // Blue Grey
  0xFFE53935, // Deep Red
  0xFFF4511E, // Dark Orange
  0xFF43A047, // Dark Green
  0xFF1E88E5, // Dark Blue
  0xFF8E24AA, // Deep Purple
  0xFF0097A7, // Deep Teal
  0xFF6D4C41, // Brown
  0xFFFFD54F, // Amber
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ImageColorStore().init(); // Khởi tạo màu ảnh
  await ImageColorStore().init(); // Khởi tạo màu ảnh
  final dioClient = DioClient();
  final sqfliteClient = SqfliteClient();
  //init service
  late final assetService = AssetService(
    dioClient: dioClient,
    sqfliteClient: sqfliteClient,
  );
  late final recordService = RecordService(
    dioClient: dioClient,
    sqfliteClient: sqfliteClient,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<AssetStore>(
          create: (_) => AssetStore(assetService),
          lazy: true, // comment cái này để disable lazy loading
        ),
        Provider<RecordStore>(
          create: (_) => RecordStore(recordService),
          lazy: true, // comment cái này để disable lazy loading
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

  //final Widget child;
  const MainScaffold({super.key});

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

  //TODO: routing to default legder
  void _testOnTap(BuildContext context) {
    debugPrint("Default ledger page");
  }

  Widget? _buildFloatingActionButton(BuildContext context, String path) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80.0, right: 0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(1, 2),
            ),
          ],
        ),
        child: CardImageSquare(
          imagePath: 'assets/icons/categories/png/Car.png',
          autoBackground: true,
          onTap: () => context.go(path),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonCardText(
                buttonText: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: appColors['astrograniteDebris'],
                    ),
                    children: [
                      TextSpan(
                        text: 'Default \n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Ledger',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                imagePath: 'assets/icons/categories/png/Journal.png',
                onTap: () => _testOnTap(context),
                size: Size(60, 50),
              ),
              SizedBox(width: 40.0),
              ButtonCardText(
                buttonText: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: appColors['astrograniteDebris'],
                    ),
                    children: [
                      TextSpan(
                        text: 'Setup \n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Budget',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                imagePath: 'assets/icons/categories/png/Expedition.png',
                onTap: () => _testOnTap(context),
                size: Size(60, 50),
              ),
            ],
          ),
        ),
        MainIndicatorSection(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors['background']!,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.loose,
                children: [
                  _buildTopBar(),
                  // PageView covers the whole screen except for the floating bottom bar
                  DraggableScrollableSheet(
                    initialChildSize: 0.7, // Start at full height
                    minChildSize: 0.7, // Can shrink to 10%
                    // maxChildSize: 1.0, // Can expand to 100%
                    expand: true,
                    builder: (context, scrollController) {
                      return PageView
                      // .builder
                      (
                        clipBehavior: Clip.none,
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index) {
                          setState(() => _currentIndex = index);
                        },

                        // itemCount: 4,
                        // itemBuilder: (context, index) => ScrollablePage(
                        //     key: PageStorageKey('page$index'),
                        //     onTap: () => context.go(AppRoutes.category.path),
                        //     scrollController: scrollController,
                        //     child: TransactionList(
                        //       scrollController: scrollController,
                        //     ),
                        //   ),
                        children: [
                          ScrollablePage(
                            key: PageStorageKey('page0'),
                            scrollController: scrollController,

                            floatingActionButton: _buildFloatingActionButton(
                              //TODO: thay path tuong ung
                              context, AppRoutes.category.path
                            ),
                            child: TransactionList(
                              scrollController: scrollController,
                            ),
                          ),
                          ScrollablePage(
                            key: PageStorageKey('page1'),
                            scrollController: scrollController,
                            floatingActionButton: _buildFloatingActionButton(
                              //TODO: thay path tuong ung
                              context, AppRoutes.category.path
                            ),
                            child: Center(child: Text('Wallet Page')),
                          ),
                          ScrollablePage(
                            key: PageStorageKey('page2'),
                            scrollController: scrollController,
                            floatingActionButton: _buildFloatingActionButton(
                              //TODO: thay path tuong ung
                              context, AppRoutes.category.path
                            ),

                            child: Center(child: Text('Settings Page')),
                          ),
                          ScrollablePage(
                            key: PageStorageKey('page3'),
                            scrollController: scrollController,
                            floatingActionButton: null,

                            child: DemoWidgetPage(),
                          ),
                        ],
                      );
                    },
                  ),
                  // Floating BottomNavigationBar
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: Container(
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
                            pageController.animateToPage(
                              index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          });
                        },
                        items: <BottomNavyBarItem>[
                          BottomNavyBarItem(
                            activeColor: appColors['astrograniteDebris']!,
                            inactiveColor: appColors['background'],
                            activeTextColor: appColors['astrograniteDebris'],
                            activeBackgroundColor:
                                appColors['richBrilliantLavender']!,
                            icon: Expanded(
                              child: Image.asset(
                                'assets/icons/categories/png/Sun.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Center(child: Text('Home')),
                          ),
                          BottomNavyBarItem(
                            activeColor: appColors['astrograniteDebris']!,
                            inactiveColor: appColors['background'],
                            activeTextColor: appColors['astrograniteDebris'],
                            activeBackgroundColor:
                                appColors['richBrilliantLavender']!,
                            icon: Expanded(
                              child: Image.asset(
                                'assets/icons/categories/png/Mountains.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Center(child: Text('Wallet')),
                          ),
                          BottomNavyBarItem(
                            activeColor: appColors['astrograniteDebris']!,
                            inactiveColor: appColors['background'],
                            activeTextColor: appColors['astrograniteDebris'],
                            activeBackgroundColor:
                                appColors['richBrilliantLavender']!,
                            icon: Expanded(
                              child: Image.asset(
                                'assets/icons/categories/png/Tree.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Center(child: Text('Settings')),
                          ),
                          BottomNavyBarItem(
                            activeColor: appColors['astrograniteDebris']!,
                            inactiveColor: appColors['background'],
                            activeTextColor: appColors['astrograniteDebris'],
                            activeBackgroundColor:
                                appColors['richBrilliantLavender']!,
                            icon: Expanded(
                              child: Image.asset(
                                'assets/icons/categories/png/Vector-26.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Center(child: Text('Widgets')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
