import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:expense_tracker/core/routing/app_routes.dart';
import 'package:expense_tracker/core/widgets/transaction_record.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScrollablePage extends StatefulWidget {
  late final ScrollController scrollController;
  //typical transaction list
  late final Widget child;

  ScrollablePage({
    super.key,
    required this.scrollController,
    required this.child,
  });

  @override
  _ScrollablePageState createState() => _ScrollablePageState();
}

class _ScrollablePageState extends State<ScrollablePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // You can use widget.index as needed
    //wrap singlechildscrollablewidget
    //SingleChildScrollView(
    // controller: widget.scrollController,
    return Container(
      decoration: BoxDecoration(
        color: appColors['pannel']!,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Drag handle
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 120,
                height: 20,
                decoration: BoxDecoration(
                  color: appColors['background'],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 8),
              ),
              Positioned(
                top: -25,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/icons/tralalerotralala.png',
                    fit: BoxFit.contain,
                    height: 40,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 0.0,
              vertical: 0.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => context.go(AppRoutes.ledgers.path),
                    child: const Center(child: Text('Ledger')),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => context.go(AppRoutes.category.path),
                    child: const Center(child: Text('Category')),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => print('clickme Bookmarks'),
                    child: const Center(child: Text('Bookmarks')),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => print('clickme Bookmarks'),
                    child: const Center(child: Text('Bookmarks')),
                  ),
                ),
              ],
            ),
          ),
          // Phan content, chi nhan duoc cac scrollable widget
          Expanded(
            child: PrimaryScrollController(
              controller: widget.scrollController,
              child: widget.child,
            ),
          ),
    
          // LayoutBuilder(
          //   builder:
          //       (context, constraints) => PrimaryScrollController(
          //         controller: widget.scrollController,
          //         child: Container(
          //           height: constraints.maxHeight,
          //           // chir nhanj scrollview widget
          //           child: widget.child,
          //         ),
          //       ),
          // ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
