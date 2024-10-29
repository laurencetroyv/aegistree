import 'package:flutter/material.dart';

class CustomImageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomImageAppBar({
    super.key,
    this.path = 'assets/images/plant-hand-bg.png',
    this.hasBackButton = true,
  });

  final String path;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
      ),
      child: hasBackButton
          ? SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
