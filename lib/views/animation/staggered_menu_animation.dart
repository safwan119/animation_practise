import 'package:animation_practise/views/menu/drawer_menu.dart';
import 'package:flutter/material.dart';

class StaggeredMenuAnimation extends StatefulWidget {
  const StaggeredMenuAnimation({super.key});

  @override
  State<StaggeredMenuAnimation> createState() => _StaggeredMenuAnimationState();
}

class _StaggeredMenuAnimationState extends State<StaggeredMenuAnimation>
    with TickerProviderStateMixin {
  late AnimationController _drawerSlideController;

  @override
  void initState() {
    _drawerSlideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    super.initState();
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  bool _isDrawerOpen() {
    return _drawerSlideController.value == 1.0;
  }

  bool _isDrawerOpening() {
    return _drawerSlideController.status == AnimationStatus.forward;
  }

  bool _isDrawerClosed() {
    return _drawerSlideController.value == 0.0;
  }

  void _toggleDrawer() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      _drawerSlideController.reverse();
    } else {
      _drawerSlideController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(children: [_buildContent(), _buildDrawer()]),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        'Flutter Menu',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      actions: [
        AnimatedBuilder(
          animation: _drawerSlideController,
          builder: (context, child) {
            return IconButton(
              onPressed: _toggleDrawer,
              icon: _isDrawerOpen() || _isDrawerOpening()
                  ? Icon(Icons.clear, color: Colors.black)
                  : Icon(Icons.menu, color: Colors.black),
            );
          },
        ),
      ],
    );
  }

  Widget _buildContent() {
    return const SizedBox();
  }

  Widget _buildDrawer() {
    return AnimatedBuilder(
      animation: _drawerSlideController,
      builder: (context, child) {
        return FractionalTranslation(
          translation: Offset(1.0 - _drawerSlideController.value, 0.0),
          child: _isDrawerClosed() ? const SizedBox() : DrawerMenu(),
        );
      },
    );
  }
}
