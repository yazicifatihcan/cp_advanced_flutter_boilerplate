import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/example_screen/controller/example_controller.dart';
import 'package:flutter_base_project/features/example_screen/view/example.dart';
import 'package:get/get.dart';

///Widget for initializing GetxController for Example Screen
class ExampleScreen extends StatelessWidget {
  ///Widget for initializing GetxController for Example Screen
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ExampleController(),
      builder: (_) =>  const Example(),
    );
  }
}
