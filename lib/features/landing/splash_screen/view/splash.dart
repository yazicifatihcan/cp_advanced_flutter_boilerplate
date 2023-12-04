import 'package:flutter/material.dart';
import '../../../../../module/common/lib/src/base_view/base_view.dart';
import '../../../../../module/common/lib/src/extensions/widgets_scale_extension.dart';
import 'package:flutter_base_project/app/utils/size/padding_and_radius.dart';
import 'package:flutter_base_project/features/landing/splash_screen/controller/splash_controller.dart';

class Splash extends StatelessWidget {

  const Splash({
    required this.controller, super.key,
  });
  final SplashController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BaseView(
        controller: controller,
        loadingView: Center(
        child: Column(
          children: [
            const Spacer(),
            FlutterLogo(size: 196.horizontalScale),
            const SizedBox(height: paddingXXXL),
            const CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              color: Colors.white,
            ),
            const Spacer(),
          ],
        ),
      ),
        child: const SizedBox.shrink(),
      ),
      
    );
  }
}
