import 'package:flutter/material.dart';


/// An abstract class for creating custom dialog widgets.
///
/// Extend this class to create your own dialog by implementing
/// the build method.
/// Use the `show` method to display the dialog.
///
/// Example:
/// ```dart
/// MyCustomDialog().show(context: context);
/// ```
abstract class DialogWidget<T> extends StatelessWidget {
  /// Creates a dialog widget.
  ///
  /// Parameters:
  /// - `padding`: The padding around the content of the dialog.
  const DialogWidget({super.key, this.padding});

  /// The padding around the content of the dialog.
  final EdgeInsets? padding;

  /// Displays the dialog using [showDialog].
  ///
  /// Parameters:
  /// - `context`: The build context.
  /// - `barrierDismissible`: Whether tapping outside the dialog dismisses it.
  /// - `barrierColor`: The color of the barrier between the content
  ///  and the overlay.
  ///
  /// Returns a [Future] that resolves to the value returned by the dialog.
  Future<T?> show({
    required BuildContext context,
    bool? barrierDismissible,
    Color? barrierColor,
  }) =>
      showDialog<T>(
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
