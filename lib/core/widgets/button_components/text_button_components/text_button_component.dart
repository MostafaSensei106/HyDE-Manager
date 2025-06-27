import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydemanager/core/config/constants/app_constants.dart';

class TextButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isClose;
  final bool useInBorderRadius;

  const TextButtonComponent({
    super.key,
    required this.text,
    required this.onPressed,
    this.isClose = false,
    this.useInBorderRadius = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        HapticFeedback.vibrate();
        onPressed();
      },
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: useInBorderRadius
              ? BorderRadius.circular(AppConstants.inBorderRadius)
              : BorderRadius.circular(AppConstants.outBorderRadius),
        ),
        elevation: 0,
        enableFeedback: true,
        enabledMouseCursor: SystemMouseCursors.click,
      ),
      child: Text(text),
    );
  }
}
