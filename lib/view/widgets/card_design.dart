import 'package:flutter/material.dart';
import 'package:tale/utils/theme/theme_manager.dart';

class CardDesign extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final VoidCallback onTap;

  const CardDesign({
    required this.width,
    required this.height,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: ThemeManager.second.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
