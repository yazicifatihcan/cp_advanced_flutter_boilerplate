import 'package:flutter/material.dart';
import 'package:flutter_base_project/product/base/controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

///Controller for BottomNavigationBar
class BottomNavigationController extends BaseControllerInterface {


final Rx<int> _selectedIndex = Rx(0);

///Getter for [_selectedIndex]
int get selectedIndex => _selectedIndex.value;
///Setter for [_selectedIndex]
set selectedIndex(int value)=>_selectedIndex.value=value;


///Items to display on bottom bar.
List<MyCustomBottomNavBarItem> get tabs => [
    const MyCustomBottomNavBarItem(
      icon: Icon(Icons.home),
      activeIcon: Icon(Icons.home),
      label: '1st',
      initialLocation: '/1st',
    ),
    const MyCustomBottomNavBarItem(
      icon: Icon(Icons.explore_outlined),
      activeIcon: Icon(Icons.explore),
      label: '2nd',
      initialLocation: '/2nd',
    ),
    const MyCustomBottomNavBarItem(
      icon: Icon(Icons.storefront_outlined),
      activeIcon: Icon(Icons.storefront),
      label: '3rd',
      initialLocation: '/3rd',
    ),
    const MyCustomBottomNavBarItem(
      icon: Icon(Icons.account_circle_outlined),
      activeIcon: Icon(Icons.account_circle),
      label: '/4th',
      initialLocation: '/4th',
    ),
  ];

  ///Function that handles bottom bar taps.
  void onTapBottomBarItem(int index) {
    if (index == selectedIndex) return;
    final router = GoRouter.of(context);
    final location = tabs[index].initialLocation;
    selectedIndex=index;
    router.go(location);
  }
}




///Class that has all required fields for BottomNavigationBar
class MyCustomBottomNavBarItem extends BottomNavigationBarItem {

  ///Class that has all required fields for BottomNavigationBar
  const MyCustomBottomNavBarItem(
      {required this.initialLocation,
      required super.icon,
      super.label,
      Widget? activeIcon,})
      : super(activeIcon: activeIcon ?? icon);
  
  ///Variable that holds location for GoRouter
  final String initialLocation;
}
