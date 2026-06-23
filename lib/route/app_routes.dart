import 'package:animation_practise/main.dart';
import 'package:animation_practise/views/animation/container_animation.dart';
import 'package:animation_practise/views/animation/fade_animation_practise.dart';
import 'package:animation_practise/views/animation/size_transition_practise.dart';
import 'package:animation_practise/views/animation/staggered_menu_animation.dart';
import 'package:animation_practise/views/demo/staggered_demo.dart';
import 'package:animation_practise/views/drag/physics_dragging_view.dart';
import 'package:animation_practise/views/dropdown/dropdown_practise_view.dart';
import 'package:animation_practise/views/paint/custom_paint_practise.dart';
import 'package:animation_practise/views/routes/page_1_route.dart';
import 'package:flutter/material.dart';

import '../views/animation/slide_transition_practise.dart';

class AppRoutes {
  static const String fadeAnimationView = '/fade_animation_view';
  static const String sizeTransitionView = '/size_transition_view';
  static const String slideTransitionView = '/slide_transition_view';
  static const String containerAnimationView = '/container_animation_view';
  static const String page1RouteView = '/page_1_view';
  static const String physicsDraggingView = '/physics_dragging_view';
  static const String staggeredDemoView = '/staggered_demo_view';
  static const String menuItemView = '/menu_item_view';
  static const String painterView = '/custom_paint_view';
  static const String dropdownPractiseView = '/dropdown_practise_view';

  static Route<dynamic> onGenerateRoutes(RouteSettings setting) {
    switch (setting.name) {
      case fadeAnimationView:
        return MaterialPageRoute(
          builder: (context) => FadeAnimationPractise(
            curve: MyApp.curves,
            duration: MyApp.duration,
          ),
        );
      case sizeTransitionView:
        return MaterialPageRoute(
          builder: (context) => SizeTransitionPractise(),
        );
      case slideTransitionView:
        return MaterialPageRoute(
          builder: (context) => SlideTransitionPractise(),
        );
      case physicsDraggingView:
        return MaterialPageRoute(builder: (context) => PhysicsDraggingView());
      case page1RouteView:
        return MaterialPageRoute(builder: (context) => Page1Route());
      case staggeredDemoView:
        return MaterialPageRoute(builder: (context) => StaggeredDemo());
      case containerAnimationView:
        return MaterialPageRoute(builder: (context) => ContainerAnimation());
      case dropdownPractiseView:
        return MaterialPageRoute(builder: (context) => DropdownPractiseView());
      case menuItemView:
        return MaterialPageRoute(
          builder: (context) => StaggeredMenuAnimation(),
        );
      case painterView:
        return MaterialPageRoute(builder: (context) => CustomPaintPractise());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text("No routes find"))),
        );
    }
  }
}
