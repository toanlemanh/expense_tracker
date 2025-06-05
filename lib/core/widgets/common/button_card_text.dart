import 'package:flutter/material.dart';


// TODO: Not done, finish
class ButtonCardText extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  const ButtonCardText({
    super.key,
    required this.title,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFFE8C6), // light peachy background
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon/Image
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color.fromARGB(255, 14, 11, 11).withOpacity(0.3),
              ),
              child: Image.asset(
                imagePath,
                width: 48,
                height: 48,
              ),
            ),
            const SizedBox(width: 12),
            // Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.split(' ').first,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  title.split(' ').length > 1 ? title.split(' ').last : '',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
