import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/common/base_view/base_view.dart';
import 'package:flutter_base_project/features/example_screen/controller/example_controller.dart';
import 'package:get/get.dart';
  
class Example extends GetView<ExampleController> {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {

     return Scaffold(
      key: controller.scaffoldKey,


      //AppBar
      appBar: AppBar(),
      

      ///Body
      body: BaseView<ExampleController>(
        controller: controller,
        child: Container(),
      ),
    );
  }
}