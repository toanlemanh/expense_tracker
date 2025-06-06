import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SingleScrollableSheet extends StatelessWidget {
  final Widget child;
  final DraggableScrollableController controller =
      DraggableScrollableController();

  SingleScrollableSheet({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: controller,
      initialChildSize: controller.isAttached ? controller.size : 0.7,
      minChildSize: 0.7,
      expand: false,
      builder: (context, scrollController) {
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

              // Content area
              Expanded(
                child: PrimaryScrollController(
                  controller: scrollController,
                  child: child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
