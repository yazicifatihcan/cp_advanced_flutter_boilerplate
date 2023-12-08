import 'package:flutter/material.dart';

extension WidgetExtension on Widget {

  Widget isVisible(bool value, {double? height, double? width}) =>
      value ? this : SizedBox(height: height, width: width);

  Widget isFiltered(bool value, ColorFilter colorFilter) =>
      value ? ColorFiltered(colorFilter: colorFilter, child: this) : this;

  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);


}