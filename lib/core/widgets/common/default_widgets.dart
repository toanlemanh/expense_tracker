import 'package:flutter/material.dart';

class DefaultWidget {
  // Default TextStyle
  static const TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: Colors.black87,
    fontWeight: FontWeight.normal,
  );

  // Default Title TextStyle
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  // // Default primary color TODO: uncomment when actually use
  // static const Color primaryColor = Colors.blue;

  // // Default accent color TODO: uncomment when actually use
  // static const Color accentColor = Colors.amber;

  // Default background color
  static const Color backgroundColor = Color(0xFFFDF1DD);

  // Default divider
  static const Divider divider = Divider(
    color: Colors.grey,
    thickness: 1,
    height: 16,
  );

  // Default padding
  static const EdgeInsets defaultPadding = EdgeInsets.all(16);

  // Default button style
  // static final ButtonStyle defaultButtonStyle = ElevatedButton.styleFrom(
  //   primary: primaryColor,
  //   onPrimary: Colors.white,
  //   textStyle: textStyle,
  //   padding: defaultPadding,
  // );
}