import 'package:flutter/material.dart';
import 'package:tale/utils/theme/theme_manager.dart';

Widget _buildSocialIcon(IconData icon, String tooltip, double size) {
  return IconButton(
    iconSize: size,
    icon: Icon(icon, color: ThemeManager.textColor),
    tooltip: tooltip,
    onPressed: () {},
  );
}
