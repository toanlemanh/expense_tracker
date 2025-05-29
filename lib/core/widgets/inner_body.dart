import 'package:flutter/material.dart';

class InnerBody extends StatefulWidget {
  const InnerBody({super.key});

  @override
  State<InnerBody> createState() => _InnerBodyState();
}

class _InnerBodyState extends State<InnerBody> {

  @override
  Widget build(BuildContext context) {
    return const Text('inner body');
  }
}
