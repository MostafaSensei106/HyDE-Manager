import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IconButtonComponent extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const IconButtonComponent({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
/// Builds an [IconButton] widget that displays an icon and
/// responds to taps by calling [onPressed] and providing haptic
/// feedback. The button's appearance is determined by the [icon]
/// property.

  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        HapticFeedback.vibrate();
        onPressed();
      },
    );
  }
}
