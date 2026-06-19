import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isFirstScreen;
  final String title;
  final VoidCallback onTap;

  const CustomAppBar({
    super.key,
    this.isFirstScreen = false,
    required this.title,
    required this.onTap,
  });

  final int _accentBarHeight = 3;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.black)),
          InkWell(
            onTap: onTap,
            child: Text(
              "Next",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      automaticallyImplyLeading: isFirstScreen ? false : true,
      backgroundColor: Colors.orange,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + _accentBarHeight);
}
