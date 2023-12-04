import 'package:flutter/material.dart';
import '../../../../module/common/lib/src/base_view/base_view.dart';
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
        child: Column(
          children: [
            // BannerAdWidget(adUnitId: Platform.isAndroid ? AdsVariables.adUnitIds[AdsType.BANNER]![PlatformType.ANDROID]!  : AdsVariables.adUnitIds[AdsType.BANNER]![PlatformType.IOS]!),
          ],
        ),
      ),
    );
  }
}