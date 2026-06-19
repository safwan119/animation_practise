import 'package:animation_practise/views/animation/staggered_animation_view.dart';
import 'package:flutter/material.dart';

import '../../route/app_routes.dart';
import '../../widgets/appbar/custom_app_bar.dart';

class StaggeredDemo extends StatefulWidget {
  const StaggeredDemo({super.key});

  @override
  State<StaggeredDemo> createState() => _StrState();
}

class _StrState extends State<StaggeredDemo> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    super.initState();
  }

  Future<void> _playAnimation() async {
    try {
      await _animationController.forward().orCancel;
      await _animationController.reverse().orCancel;
    } on TickerCanceled {
      // The animation got canceled, probably because it was disposed of.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Staggered animation",
        onTap: () => Navigator.pushNamed(context, AppRoutes.menuItemView),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.1),
              border: Border.all(color: Colors.black.withValues(alpha: 0.5)),
            ),
            child: StaggeredAnimationView(controller: _animationController),
          ),
        ),
      ),
    );
  }
}
