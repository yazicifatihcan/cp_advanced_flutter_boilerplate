import 'package:flutter/material.dart';


extension WidgetExtension on Widget {
  
  Widget isVisible(bool value, {double? height, double? width}) =>
      value ? this : SizedBox(height: height, width: width);

  Widget isFiltered(bool value, ColorFilter colorFilter) =>
      value ? ColorFiltered(colorFilter: colorFilter, child: this) : this;

  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);

  Future<T?> openDialog<T>({required BuildContext context, bool? barrierDismissible, Color? barrierColor}) {
    return showDialog<T>(
      barrierDismissible: barrierDismissible ?? true,
      barrierColor: barrierColor ?? Colors.black45,
      context: context ,
      builder: (BuildContext context) {
        return this;
      },
    );
  }

  Future<T?> openSimpleDialog<T>({
    required BuildContext context,
    Color? barrierColor,
    bool? barrierDismissible,
    EdgeInsetsGeometry? padding,
  }) {
    return Dialog(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(paddingXL),
        child: this,
      ),
    ).openDialog<T>(context: context, barrierColor: barrierColor, barrierDismissible: barrierDismissible);
  }

  Future<T?> openBottomSheet<T>({
    required BuildContext context,
    Color? barrierColor,
    Color? backgroundColor,
    bool? barrierDismissible,
    ShapeBorder? shape,
    BoxConstraints? constraints,
    bool? isScrollControlled,
    bool? useRootNavigator,
    bool? isDismissible,
    bool? enableDrag,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      barrierColor: barrierColor,
      backgroundColor: backgroundColor,
      isScrollControlled: isScrollControlled ?? false,
      useRootNavigator: useRootNavigator ?? false,
      isDismissible: isDismissible ?? true,
      enableDrag: enableDrag ?? true,
      shape: shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(radiusXXL),
            ),
          ),
      constraints: constraints,
      builder: (BuildContext context) {
        return this;
      },
    );
  }
}
