import 'package:flutter/material.dart';

class TextInputRounded extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final void Function(String)? onChanged;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  

  const TextInputRounded({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.backgroundColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    String placeholder    = hintText ?? 'Enter text here';
    Color backgroundColor = this.backgroundColor ?? const Color(0xFFFDF1DD);
    TextStyle textStyle   = this.textStyle ?? const TextStyle(color: Colors.black87);
    TextStyle hintStyle   = textStyle.copyWith(color: Colors.grey,);

    return TextField(
      controller: controller,
      onChanged:  onChanged,
      style:      textStyle,
      decoration: InputDecoration(
        hintText:       placeholder,
        hintStyle:      hintStyle,
        filled:         true,
        fillColor:      backgroundColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        border:         OutlineInputBorder(
          borderRadius:   BorderRadius.circular(24),
          borderSide:     BorderSide.none,
        ),
      ),
    );
  }
}
