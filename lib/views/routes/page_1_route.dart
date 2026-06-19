import 'package:animation_practise/views/routes/page_2_route.dart';
import 'package:flutter/material.dart';

class Page1Route extends StatelessWidget {
  const Page1Route({super.key});

  Route<void> _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page2Route(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const Offset begin = Offset(0.0, 1.0);
        const Offset end = Offset.zero;
        const Curve curve = Curves.easeInOutCubicEmphasized;
        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 1")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(_createRoute()),
          child: Text("Go!"),
        ),
      ),
    );
  }
}
