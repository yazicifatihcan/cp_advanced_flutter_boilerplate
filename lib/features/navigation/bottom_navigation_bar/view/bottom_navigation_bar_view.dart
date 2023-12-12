import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/navigation/bottom_navigation_bar/controller/bottom_navigation_controller.dart';
import 'package:get/get.dart';


///General View for all bottom bar views
class BottomNavigationBarView extends GetView<BottomNavigationController> {
  ///General View for all bottom bar views
  const BottomNavigationBarView({required this.child, super.key, });

  ///View to display on bottom bar screen body
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,

      body: SafeArea(child: child),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF434343),
        selectedFontSize: 12,
        unselectedItemColor: const Color(0xFF838383),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: controller.onTapBottomBarItem,
        currentIndex: controller.selectedIndex,
        items: controller.tabs,
      ),
    );
  }
}
