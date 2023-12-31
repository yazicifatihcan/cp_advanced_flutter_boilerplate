import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/example_screen/controller/example_controller.dart';
import 'package:flutter_base_project/product/base/base_view.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

///Widget for Example Screen View
class Example extends GetView<ExampleController> {
  ///Widget for Example Screen View
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,

      ///Body
      body: BaseView<ExampleController>(
        controller: controller,
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const IconAssets().circleDoneIcon.svg(),
            ],
          ),
        ),
      ),
    );
  }
}
