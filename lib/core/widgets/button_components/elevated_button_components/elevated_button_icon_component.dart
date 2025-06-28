import 'package:flutter/material.dart' show ElevatedButton, Theme;
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydemanager/core/config/constants/app_constants.dart';

class ElevatedButtonIconComponent extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() onPressed;
  final bool isEnabled;
  final bool useMargin;
  final bool useInBorderRadius;

  const ElevatedButtonIconComponent({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isEnabled = true,
    this.useMargin = false,
    this.useInBorderRadius = false,
  });

  void onTap() {
    HapticFeedback.vibrate();
    onPressed();
  }

  @override
  /// Builds a [Container] widget containing an [ElevatedButton.icon] with customizable
  /// properties. The button's appearance and behavior depend on the provided parameters:
  /// [isEnabled] determines if the button is active or disabled, [useMargin] adds a top margin,
  /// and [useInBorderRadius] controls the border radius. The button displays an icon and a
  /// label, with styling based on the current theme's color scheme.
  Widget build(BuildContext context) {
    return Container(
      margin: useMargin ? EdgeInsets.only(top: AppConstants.margin.h) : null,
      child: ElevatedButton.icon(
        onPressed: isEnabled ? onTap : null,
        icon: Icon(icon, size: AppConstants.iconSize),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          disabledBackgroundColor: Theme.of(context).colorScheme.error,
          disabledForegroundColor: Theme.of(context).colorScheme.onError,
          iconColor: Theme.of(context).colorScheme.onPrimaryContainer,
          disabledIconColor: Theme.of(context).colorScheme.onError,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: useInBorderRadius
                ? BorderRadius.circular(AppConstants.inBorderRadius)
                : BorderRadius.circular(AppConstants.outBorderRadius),
          ),
          elevation: 2,
          enableFeedback: true,
          enabledMouseCursor: WidgetStateMouseCursor.clickable,
        ),
      ),
    );
  }
}
