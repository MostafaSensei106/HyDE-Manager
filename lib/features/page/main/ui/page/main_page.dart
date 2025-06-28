import 'dart:io' show Process, Platform, stderr;

import 'package:flutter/material.dart'
    show
        AppBar,
        Icons,
        NavigationRail,
        NavigationRailDestination,
        NavigationRailLabelType,
        Scaffold,
        ScaffoldMessenger,
        SnackBar,
        IconButton,
        Theme,
        Colors;
import 'package:flutter/widgets.dart';
import 'package:hydemanager/core/widgets/button_components/elevated_button_components/elevated_button_icon_component.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  bool _isNavigationRailVisible = true;
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _animationController.forward();
  }

  void _toggleNavigationRail() {
    setState(() {
      _isNavigationRailVisible = !_isNavigationRailVisible;
      if (_isNavigationRailVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  Future<void> openFileInTerminal(String editor, String filePath) async {
    final terminalCandidates = ['alacritty', 'kitty'];

    for (final terminal in terminalCandidates) {
      try {
        final result = await Process.run('which', [terminal]);
        if (result.exitCode == 0) {
          await Process.start(terminal, [
            '-e',
            '$editor',
            '$filePath',
          ], runInShell: true);
          return;
        }
      } catch (_) {
        continue;
      }
    }

    stderr.writeln('❌ لم يتم العثور على أي تطبيق Terminal متاح');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _toggleNavigationRail,
        ),
      ),
      body: Row(
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: NavigationRail(
                backgroundColor: Colors.transparent,
                indicatorColor: Theme.of(context).colorScheme.primaryContainer,
                indicatorShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),

                  child: ElevatedButtonIconComponent(
                    label: 'Edit Config',
                    icon: Icons.edit_note_outlined,
                    useInBorderRadius: true,
                    onPressed: () {
                      if (Platform.isLinux) {
                        openFileInTerminal(
                          'nano',
                          '/home/${Platform.environment['USER']}/.config/hypr/userprefs.conf',
                        );
                        (context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'This feature is only available on Linux',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                labelType: NavigationRailLabelType.all,
                useIndicator: true,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.color_lens_outlined),
                    label: Text('Style'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings_outlined),
                    label: Text('Settings'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.info_outline_rounded),
                    label: Text('About'),
                  ),
                ],
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
          Expanded(child: Center(child: Text('Index: $_selectedIndex'))),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
