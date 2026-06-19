import 'package:flutter/material.dart';

import '../../route/app_routes.dart';
import '../../widgets/appbar/custom_app_bar.dart';

class Page2Route extends StatefulWidget {
  const Page2Route({super.key});

  @override
  State<Page2Route> createState() => _Page2RouteState();
}

class _Page2RouteState extends State<Page2Route> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Route animation page 2",
        onTap: () => Navigator.pushNamed(context, AppRoutes.staggeredDemoView),
      ),
    );
  }
}
