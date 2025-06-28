import 'package:flutter/material.dart' show Theme;
import 'package:flutter/widgets.dart'
    show
        StatelessWidget,
        BuildContext,
        Widget,
        Container,
        BoxDecoration,
        BorderRadius;
import 'package:hydemanager/core/config/constants/app_constants.dart'
    show AppConstants;

class AppContainerComponent extends StatelessWidget {
  final Widget child;
  final bool useInBorderRadius;
  const AppContainerComponent({
    super.key,
    required this.child,
    this.useInBorderRadius = false,
  });

  @override
  /// Returns a [Container] widget with the given properties.
  ///
  /// The [color] property of the [BoxDecoration] is set to the
  /// [Theme.of(context).colorScheme.surfaceContainer] color.
  ///
  /// The [borderRadius] property of the [BoxDecoration] is set to a
  /// [BorderRadius.circular] with a radius determined by the
  /// [useInBorderRadius] property.
  ///
  /// The [child] is passed as-is.
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: useInBorderRadius
            ? BorderRadius.circular(AppConstants.inBorderRadius)
            : BorderRadius.circular(AppConstants.outBorderRadius),
      ),
      child: child,
    );
  }
}
