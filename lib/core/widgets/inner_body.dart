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

    return const Text('inner body');
  }
}
