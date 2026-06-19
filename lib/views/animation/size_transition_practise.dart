import 'package:flutter/material.dart';

import '../../route/app_routes.dart';
import '../../widgets/appbar/custom_app_bar.dart';

class SizeTransitionPractise extends StatefulWidget {
  const SizeTransitionPractise({super.key});

  @override
  State<SizeTransitionPractise> createState() => _SizeTransitionPractiseState();
}

class _SizeTransitionPractiseState extends State<SizeTransitionPractise>
    with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();
  late final Animation<double> _curvedAnimation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _animationController.dispose();
    // _curvedAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Size transition",
        onTap: () => Navigator.pushNamed(context, AppRoutes.slideTransitionView),
      ),
      body: SizeTransition(
        sizeFactor: _curvedAnimation,
        axis: .horizontal,
        axisAlignment: -1.0,
        child: Center(child: const FlutterLogo(size: 200.0)),
      ),
    );
  }
}
