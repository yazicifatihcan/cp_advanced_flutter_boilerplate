import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/landing/splash_screen/controller/splash_controller.dart';
import 'package:flutter_base_project/product/base/base_view.dart';
import 'package:flutter_base_project/product/utility/enums/project_padding.dart';
import 'package:widgets/widget.dart';

///Widget for Splash Screen View
class Splash extends StatelessWidget {
  ///Widget for Splash Screen View
  const Splash({
    required this.controller,
    super.key,
  });

  ///It takes controller as parameter to avoid duplicate
  ///controller error. When restarting the app etc.
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
              // const FlutterLogo(size: 196),
              SizedBox(height: ProjectPadding.l.value),
              const CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                color: Colors.white,
              ),
              const Spacer(),
              const GeneralCachedImage(),
            ],
          ),
        ),
        child: const SizedBox.shrink(),
      ),
    );
  }
}
