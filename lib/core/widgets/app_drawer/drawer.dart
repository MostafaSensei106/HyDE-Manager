import 'package:flutter/material.dart' show Drawer;
import 'package:flutter/widgets.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(padding: EdgeInsets.zero));
  }
}
