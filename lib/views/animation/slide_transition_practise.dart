import 'package:flutter/material.dart';

import '../../route/app_routes.dart';
import '../../widgets/appbar/custom_app_bar.dart';

class SlideTransitionPractise extends StatefulWidget {
  const SlideTransitionPractise({super.key});

  @override
  State<SlideTransitionPractise> createState() =>
      _SlideTransitionPractiseState();
}

class _SlideTransitionPractiseState extends State<SlideTransitionPractise>
    with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation =
      Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 1.0)).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.elasticIn),
      );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Slide transition",
        onTap: () => Navigator.pushNamed(context, AppRoutes.containerAnimationView),
      ),
      body: SlideTransition(
        position: _offsetAnimation,
        child: Center(child: FlutterLogo(size: 100.0)),
      ),
    );
  }
}
