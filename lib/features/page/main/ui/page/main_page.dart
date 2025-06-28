
import 'package:flutter/material.dart' show Scaffold, AppBar;
import 'package:flutter/widgets.dart' show StatelessWidget, BuildContext, Widget, Text;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page'),),

    );
}
}