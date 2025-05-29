import 'package:flutter/material.dart';

class InnerBody extends StatefulWidget {
  const InnerBody({super.key});

  @override
  State<InnerBody> createState() => _InnerBodyState();
}

class _InnerBodyState extends State<InnerBody> {
  double top = 200;
  double _initialTop = 200;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Background content
        Container(
          color: Colors.blueGrey.shade50,
          child: const Text('Thay content vào đây'),
        ),

        // Floating panel
        AnimatedPositioned(
          duration:
              _isDragging ? Duration.zero : const Duration(milliseconds: 200),
          top: top,
          left: 0,
          right: 0,
          child: GestureDetector(
            onVerticalDragStart: (_) {
              setState(() => _isDragging = true);
            },
            onVerticalDragUpdate: (details) {
              setState(() {
                top += details.delta.dy;
                top = top.clamp(100.0, screenHeight - 200);
              });
            },
            onVerticalDragEnd: (_) {
              setState(() {
                _isDragging = false;
                top = _initialTop; // Snap back to default
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xfff8e9d4),
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Icon(Icons.drag_handle),
                  SizedBox(height: 8),
                  // Add more content as needed
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
