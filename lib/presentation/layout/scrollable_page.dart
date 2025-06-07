import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:expense_tracker/core/routing/app_routes.dart';
import 'package:expense_tracker/core/widgets/common/button_card_text_under.dart';
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
      //Column chứa cả đoạn con cá mập và transaction list
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
                top: -25, // Adjust as needed to overlay more/less
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/icons/tralalerotralala.png',
                    fit: BoxFit.contain,
                    height: 40, // Adjust as needed
                  ),
                ),
              ),
            ],
          ),
          // List cac option menu bao gom: ledger, category, bookmarks
          //
          //=> la cac nut bam dua den trang detail
          // moi trang detail la mot page co layout don
          //gian gom appbar, list va floating button
          // @TODO: lam cac nut bam (Thanh dang lam do)
          // lam tam cac nut bam co the chuyen sang trang khac (dung go router)
          // configure sau nay co the them vao mot muc moi de dang (Toan)
          // Lam 1 trang detail sample, moi ledger co mot type => truyen url 1 type
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
            child: Row(
              children: [
                Expanded(
                  child: ButtonCardTextUnder(
                    imagePath: 'assets/icons/categories/png/Journal.png',
                    onTap: () => context.go(AppRoutes.ledgers.path),
                    buttonText: const Text('Ledger'),
                    size: Size(30,30),
                    
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ButtonCardTextUnder(
                    imagePath: 'assets/icons/categories/png/Vector-22.png',
                    onTap: () => context.go(AppRoutes.category.path),
                    buttonText: const Text('Category'),
                     size: Size(30,30),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child:  ButtonCardTextUnder(
                    imagePath: 'assets/icons/categories/png/Vector-13.png',
                    onTap: () => context.go(AppRoutes.bookmarks.path),
                    buttonText: const Text('Bookmarks'),
                    size: Size(30,30),
                  ),
                ),
                // const SizedBox(width: 20),
               ],
            ),
          ),

          // Transaction list trong này
          // Transaction nhận 2 biến pagekey (theo idex) và scrollController của DraggableScrollableSheet
          Expanded(
            child: PrimaryScrollController(
              controller: widget.scrollController,
              child: Container(
                // color: appColors['pannel'],
                //typical TransactionRecord(title: items[index], itemColor: colors[index])
                child: widget.child,
              ),
              //  widget.child,
            ),
          ),
        ],
      ),
    );

    //  ListView.builder(
    //   key: widget.key,
    //   controller: widget.scrollController,
    //   itemCount: items.length,
    //   itemBuilder: (context, index) {
    //     return Container(
    //       // color: appColors['pannel'],
    //       //typical TransactionRecord(title: items[index], itemColor: colors[index])
    //       child: widget.child,
    //     );
    //   },
    // );
  }

  @override
  bool get wantKeepAlive => true;
}
