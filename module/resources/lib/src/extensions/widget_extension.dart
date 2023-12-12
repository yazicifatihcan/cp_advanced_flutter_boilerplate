import 'package:flutter/material.dart';

/// Flutter extension methods for convenient widget modifications.
extension WidgetExtension on Widget {
  /// Conditionally sets the visibility of the widget.
  ///
  /// If [value] is `true`, returns the original widget; otherwise, returns
  /// a SizedBox with the specified [height] and [width].
  Widget isVisible({required bool value, double? height, double? width}) =>
      value ? this : SizedBox(height: height, width: width);

  /// Conditionally applies a [colorFilter] to the widget.
  ///
  /// If [value] is `true`, returns the original widget with the applied
  /// [colorFilter]; otherwise, returns the original widget.
  Widget isFiltered({required bool value, required ColorFilter colorFilter}) =>
      value ? ColorFiltered(colorFilter: colorFilter, child: this) : this;

  /// Converts the widget into a SliverToBoxAdapter.
  ///
  /// Returns a SliverToBoxAdapter with the original widget as its child.
  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);
}
