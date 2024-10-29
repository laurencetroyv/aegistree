import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/src.dart';

class ResourceContainer extends ConsumerWidget {
  const ResourceContainer(
    this.title, {
    super.key,
    required this.to,
    required this.icon,
    this.isNetwork = false,
  });

  final Widget to;
  final String icon;
  final String title;
  final bool isNetwork;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultShadow = BoxShadow(
      color: Colors.black.withOpacity(.25),
      blurRadius: 4,
      offset: const Offset(0, 4),
    );

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => to),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEFFFE9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [defaultShadow],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isNetwork)
                Image.network(icon)
              else
                Image.asset("assets/images/$icon.png"),
              const Gap(12),
              Koho(
                title,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF247408),
                textAlign: TextAlign.center,
                shadow: [defaultShadow],
              )
            ],
          ),
        ),
      ),
    );
  }
}
