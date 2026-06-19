import 'package:flutter/material.dart';

class StaggeredAnimationView extends StatelessWidget {
  StaggeredAnimationView({super.key, required this.controller});

  late final Animation<double> opacity = Tween<double>(begin: 0.0, end: 1.0)
      .animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 0.100, curve: Curves.ease),
        ),
      );
  late final Animation<double> width = Tween<double>(begin: 50.0, end: 150.0)
      .animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.125, 0.250, curve: Curves.ease),
        ),
      );
  final AnimationController controller;
  late final Animation<double> height = Tween<double>(begin: 100, end: 300)
      .animate(
        CurvedAnimation(parent: controller, curve: const Interval(.250, .375)),
      );
  late final Animation<EdgeInsets> padding =
      EdgeInsetsTween(
        begin: EdgeInsets.all(8),
        end: EdgeInsets.all(20.0),
      ).animate(
        CurvedAnimation(parent: controller, curve: const Interval(.250, .375)),
      );
  late final Animation<BorderRadius?> borderRadius =
      BorderRadiusTween(
        begin: BorderRadius.circular(4),
        end: BorderRadius.circular(75),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.375, 0.500, curve: Curves.ease),
        ),
      );
  late final Animation<Color?> color =
      ColorTween(begin: Colors.white12, end: Colors.orange).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.500, 0.750, curve: Curves.ease),
        ),
      );

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
            color: color.value,
            border: Border.all(color: Colors.indigo[300]!, width: 3),
            borderRadius: borderRadius.value,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(builder: _buildAnimation, animation: controller);
  }
}
