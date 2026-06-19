import 'package:animation_practise/widgets/container/logo_animated.dart';
import 'package:flutter/material.dart';

class AnimatedWidgetView extends StatefulWidget {
  const AnimatedWidgetView({super.key});

  @override
  State<AnimatedWidgetView> createState() => _AnimatedWidgetViewState();
}

class _AnimatedWidgetViewState extends State<AnimatedWidgetView>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LogoAnimated(animation: animation);
  }
}
