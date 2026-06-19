import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class DraggableCard extends StatefulWidget {
  final Widget child;

  const DraggableCard({super.key, required this.child});

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _animation;
  Alignment _dragAlignment = Alignment.center;

  void _runAnimation(Offset pixelPerSecond, Size size) {
    _animation = _animationController.drive(
      AlignmentTween(begin: _dragAlignment, end: Alignment.center),
    );
    final unitPerSecondX = pixelPerSecond.dx / size.width;
    final unitPerSecondY = pixelPerSecond.dy / size.height;
    final unitPerSeconds = Offset(unitPerSecondX, unitPerSecondY);
    final unitVelocity = unitPerSeconds.distance;
    final spring = SpringDescription(mass: 1, stiffness: 1, damping: 1);
    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    _animationController.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) => _animationController.stop(),
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _dragAlignment,
        child: Card(child: widget.child),
      ),
    );
  }
}
