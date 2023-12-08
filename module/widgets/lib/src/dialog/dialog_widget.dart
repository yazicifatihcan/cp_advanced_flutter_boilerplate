import 'package:flutter/material.dart';

abstract class DialogWidget<T> extends StatelessWidget {

  const DialogWidget({super.key, this.padding});
  final EdgeInsets? padding;

  Future<T?> show({required BuildContext context,bool? barrierDismissible,Color? barrierColor}) => showDialog<T>(
      barrierDismissible: barrierDismissible ?? true,
      barrierColor: barrierColor ?? Colors.black45,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: this,
      ),
    );
      },
    );
  

  @override
  Widget build(BuildContext context);
}
