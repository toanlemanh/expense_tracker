import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SingleScrollableSheet extends StatelessWidget {
  final Widget child;
  final DraggableScrollableController controller = DraggableScrollableController();

  SingleScrollableSheet({
    super.key,
    required this.child
  });

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
          ),
          child: Column(
            children: [
              // Drag handle
              Container(
                width: 40,
                height: 6,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
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
