import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/navigation/bottom_navigation_bar/controller/bottom_navigation_controller.dart';
import 'package:flutter_base_project/features/navigation/bottom_navigation_bar/view/bottom_navigation_bar_view.dart';
import 'package:get/get.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BottomNavigationController(),
      builder: (_) => BottomNavigationBarView(child: child),
    );
  }
}
