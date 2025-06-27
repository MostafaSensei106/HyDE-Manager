import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydemanager/core/config/constants/app_constants.dart';
import 'package:hydemanager/core/config/constants/app_enums.dart';
import 'package:hydemanager/core/widgets/app_divider_components/full_app_divider_components.dart';

class ListTileWidgetComponent extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool selected;
  final bool useinBorderRadius;
  final ListTileGroupType groupType;

  const ListTileWidgetComponent({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    required this.selected,
    this.useinBorderRadius = false,
    required this.groupType,
  });

  /// Calculates the border radius for the [ListTile] based on the [ListTileGroupType]
  /// and [useinBorderRadius].
  ///
  /// The [ListTileGroupType.top] and [ListTileGroupType.bottom] will have a border
  /// radius on the top and bottom respectively, while [ListTileGroupType.single] will
  /// have a border radius on all sides. [ListTileGroupType.middle] and
  /// [ListTileGroupType.none] will have no border radius.
  ///
  /// If [useinBorderRadius] is `true`, the radius will be set to
  /// [AppConstants.inBorderRadius], otherwise it will be set to
  /// [AppConstants.outBorderRadius].
  BorderRadius _getBorderRadius() {
    final borderRadius = useinBorderRadius
        ? AppConstants.inBorderRadius
        : AppConstants.outBorderRadius;
    switch (groupType) {
      case ListTileGroupType.top:
        return BorderRadius.vertical(top: Radius.circular(borderRadius));
      case ListTileGroupType.bottom:
        return BorderRadius.vertical(bottom: Radius.circular(borderRadius));
      case ListTileGroupType.single:
        return BorderRadius.circular(borderRadius);
      case ListTileGroupType.middle:
        return BorderRadius.zero;
      case ListTileGroupType.none:
        return BorderRadius.circular(0);
    }
  }

  @override
  /// Builds a [Container] widget with a [Column] containing a [Material]
  /// widget wrapping a [ListTile]. The appearance and behavior of the
  /// [ListTile] are determined by the provided parameters. It includes
  /// customizable [leading], [title], [subtitle], and [trailing] widgets.
  /// The [onTap] callback is triggered when the [InkWell] is tapped.
  /// The border radius is configured based on the [groupType] and
  /// [useinBorderRadius] properties, and the background color is set
  /// according to the current theme's color scheme.
  Widget build(BuildContext context) {
    final borderRadius = _getBorderRadius();
    return Container(
      margin: groupType == ListTileGroupType.top
          ? EdgeInsets.only(top: AppConstants.margin.h)
          : null,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: borderRadius,
              child: ListTile(
                leading: leading is IconData
                    ? Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                        ),
                        child: Icon(leading as IconData),
                      )
                    : leading,
                title: Text(title),
                subtitle: subtitle != null
                    ? Text(subtitle!, overflow: TextOverflow.ellipsis)
                    : null,
                trailing: trailing,
                horizontalTitleGap: 13,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 0,
                ),
              ),
            ),
          ),
          if (groupType == ListTileGroupType.middle)
            const FullAppDividerComponents(),
        ],
      ),
    );
  }
}
