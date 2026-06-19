import 'package:animation_practise/route/app_routes.dart';
import 'package:animation_practise/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FadeAnimationPractise extends StatefulWidget {
  const FadeAnimationPractise({
    required this.duration,
    required this.curve,
    super.key,
  });

  final Duration duration;
  final Curve curve;

  @override
  State<FadeAnimationPractise> createState() => _FadeAnimationPractiseState();
}

class _FadeAnimationPractiseState extends State<FadeAnimationPractise>
    with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..repeat(reverse: true);
  late final CurvedAnimation _curvedAnimation = CurvedAnimation(
    parent: _animationController,
    curve: widget.curve,
  );

  @override
  void didUpdateWidget(FadeAnimationPractise oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _animationController
        ..duration = widget.duration
        ..repeat(reverse: true);
    }
    if (oldWidget.curve != widget.curve) {
      _curvedAnimation.curve = widget.curve;
    }
  }

  @override
  void dispose() {
    _curvedAnimation.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Fade transition",
        onTap: () => Navigator.pushNamed(context, AppRoutes.sizeTransitionView),
        isFirstScreen: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ColoredBox(
              color: Colors.white,
              child: FadeTransition(
                opacity: _curvedAnimation,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlutterLogo(size: 100),
                ),
              ),
            ),
          ),
          Text("Hello World!")
              .animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .scale() // inherits duration from fadeIn
              .move(
                delay: 300.ms,
                duration: 600.ms,
              ) // runs after the above w/new duration
              .align(), // inherits the delay & duration from move
        ],
      ),
    );
  }
}
