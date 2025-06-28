import 'package:flutter/material.dart' show kToolbarHeight, AppBar, Colors;
import 'package:flutter/widgets.dart'
    show Size, StatelessWidget, PreferredSizeWidget, BuildContext, Widget, Text;
import 'package:hydemanager/core/widgets/app_bar_component/action_drawer_icons.dart'
    show ActionDrawerIcon;

class HyDEAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const HyDEAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: const ActionDrawerIcon(),
      title: Text(title),
      centerTitle: true,
    );
  }
}
