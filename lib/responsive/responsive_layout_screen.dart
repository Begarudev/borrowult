import 'package:borrowult/utils/dimesions.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget MobileScreenLayout;
  const ResponsiveLayout(
      {super.key,
        required this.webScreenLayout,
        required this.MobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          //web screen
          return webScreenLayout;
        } else {
          // mobile screen
          return MobileScreenLayout;
        }
      },
    );
  }
}
