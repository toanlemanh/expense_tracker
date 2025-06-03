import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:expense_tracker/core/widgets/transaction_record.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';

class ScrollablePage extends StatefulWidget {
  late final ScrollController scrollController;
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

          // Transaction list trong này
          // Transaction nhận 2 biến pagekey (theo idex) và scrollController của DraggableScrollableSheet
          Expanded(
            child: PrimaryScrollController(
              controller: widget.scrollController,
              child: Container(
                    // color: appColors['pannel'],
                    //typical TransactionRecord(title: items[index], itemColor: colors[index])
                    child: widget.child,
                  )
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
