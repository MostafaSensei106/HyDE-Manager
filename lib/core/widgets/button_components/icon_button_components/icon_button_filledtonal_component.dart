import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydemanager/core/config/constants/app_constants.dart';

class IconButtonFilledTonalComponent extends StatelessWidget {
  final bool useInBorderRadius;
  final Color color;

  final IconData icon;
  final VoidCallback onPressed;
  const IconButtonFilledTonalComponent({
    super.key,
    this.useInBorderRadius = false,
    required this.color,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      icon: Icon(icon),
      onPressed: () {
        HapticFeedback.vibrate();
        onPressed();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(color),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: useInBorderRadius
                ? BorderRadius.circular(AppConstants.inBorderRadius)
                : BorderRadius.circular(AppConstants.outBorderRadius),
          ),
        ),
      ),
    );
  }
}
