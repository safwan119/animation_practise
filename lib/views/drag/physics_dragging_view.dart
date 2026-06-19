import 'package:animation_practise/widgets/card/draggable_card.dart';
import 'package:flutter/material.dart';

import '../../route/app_routes.dart';
import '../../widgets/appbar/custom_app_bar.dart';

class PhysicsDraggingView extends StatefulWidget {
  const PhysicsDraggingView({super.key});

  @override
  State<PhysicsDraggingView> createState() => _PhysicsDraggingViewState();
}

class _PhysicsDraggingViewState extends State<PhysicsDraggingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Physics dragging",
        onTap: () => Navigator.pushNamed(context, AppRoutes.page1RouteView),
      ),
      body: DraggableCard(child: FlutterLogo(size: 130)),
    );
  }
}
