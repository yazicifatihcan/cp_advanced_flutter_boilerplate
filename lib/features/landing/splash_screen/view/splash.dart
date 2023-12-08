import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/landing/splash_screen/controller/splash_controller.dart';
import 'package:flutter_base_project/product/base/base_view.dart';
import 'package:flutter_base_project/product/utility/enums/project_padding.dart';
import 'package:flutter_base_project/product/utility/extension/num_extension.dart';

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
            SizedBox(height: ProjectPadding.large.value),
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
