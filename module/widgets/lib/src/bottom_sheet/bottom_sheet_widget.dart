import 'package:flutter/material.dart';

abstract class BottomSheetWidget<T> extends StatelessWidget {

  const BottomSheetWidget({
    super.key,
    this.barrierColor,
    this.barrierDismissible,
    this.shape,
    this.constraints,
    this.isScrollControlled,
    this.useRootNavigator,
    this.isDismissible,
    this.enableDrag,
    this.backgroundColor,
  });
  final Color? barrierColor;
  final Color? backgroundColor;
  final bool? barrierDismissible;
  final ShapeBorder? shape;
  final BoxConstraints? constraints;
  final bool? isScrollControlled;
  final bool? useRootNavigator;
  final bool? isDismissible;
  final bool? enableDrag;

  Future<T?> showBottomSheet({required BuildContext context}) => showModalBottomSheet<T>(
      context: context,
      barrierColor: barrierColor,
      backgroundColor: backgroundColor,
      isScrollControlled: isScrollControlled ?? false,
      useRootNavigator: useRootNavigator ?? false,
      isDismissible: isDismissible ?? true,
      enableDrag: enableDrag ?? true,
      shape: shape,
      constraints: constraints,
      builder: (BuildContext context) {
        return this;
      },
    );

  @override
  Widget build(BuildContext context);
}
