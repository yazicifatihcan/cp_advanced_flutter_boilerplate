import 'package:flutter/material.dart';
import 'package:flutter_base_project/product/base/components/general_error_view.dart';
import 'package:flutter_base_project/product/base/components/general_loading_view.dart';
import 'package:flutter_base_project/product/base/controller/base_controller.dart';
import 'package:flutter_base_project/product/init/i10n/i10n.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';


///Base View that handles loading states etc. automatically.
class BaseView<T extends BaseControllerInterface> extends StatelessWidget {
  ///Base View that handles loading states etc. automatically.
  const BaseView({
    required this.controller,
    required this.child,
    this.onTapTryAgain,
    this.loadingView,
    this.errorView,
    super.key,
  });
  ///Function to call whe [GeneralErrorView] is dispalyed
  ///and try again button clicked.
  final VoidCallback? onTapTryAgain;
  ///Widget to display when status is loading.
  final Widget child;
  ///Widget to display instead of [GeneralLoadingView]
  final Widget? loadingView;
  ///Widget to display instead of [GeneralErrorView]
  final Widget? errorView;
  ///Controller of the current screen. 
  ///Needs to extend from [BaseControllerInterface]
  final T controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.loadingStatus.isError
          ? (errorView ??
              GeneralErrorView(
                message: controller.errorMessage ??
                    AppLocalization.getLabels.defaultErrorMessage,
                onTapTryAgain: onTapTryAgain ?? controller.onReady,
              ))
          : (controller.loadingStatus.isLoaded ||
                  controller.loadingStatus.isProcessing)
              ? child
              : loadingView ?? const GeneralLoadingView();
    });
  }
}
