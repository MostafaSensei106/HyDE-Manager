import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydemanager/core/config/constants/app_constants.dart';

class ButtonCompnent extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() onPressed;
  final bool isEnabled;
  final bool useMargin;
  final bool useInBorderRadius;

  const ButtonCompnent({
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
  /// Returns a [SizedBox] widget with a [ElevatedButton.icon] widget as child.
  /// The [ElevatedButton.icon] widget is configured with the given properties.
  ///
  /// The [ElevatedButton.icon] widget is fully enabled if [isEnabled] is true,
  /// otherwise it is disabled.
  ///
  /// The [ElevatedButton.icon] widget has a rounded border with the
  /// [SenseiConst.inBorderRadius] radius, and an elevation of 2.
  ///
  /// The button is filled with the [Theme.of(context).colorScheme.primaryContainer]
  /// color and has a foreground color of
  /// [Theme.of(context).colorScheme.onPrimaryContainer].
  ///
  /// The button icon is filled with the [Theme.of(context).colorScheme.onPrimaryContainer]
  /// color and has a size of [SenseiConst.iconSize].
  ///
  /// The button label is filled with the [Theme.of(context).colorScheme.onPrimaryContainer]
  /// color and has a size of [SenseiConst.iconSize].
  ///
  /// When the button is disabled, the background color is set to
  /// [Theme.of(context).colorScheme.error], the foreground color is set to
  /// [Theme.of(context).colorScheme.onError], and the icon color is set to
  /// [Theme.of(context).colorScheme.onError].
  ///
  /// The button has a padding of [SenseiConst.padding] around it, and an enabled
  /// mouse cursor.
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
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
