// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconAssets {
const IconAssets();



SvgGeneralImage get circleDoneIcon => const SvgGeneralImage('module/resources/assets/icons/circle_done_icon.svg');

SvgGeneralImage get errorIcon => const SvgGeneralImage('module/resources/assets/icons/error_icon.svg');

SvgGeneralImage get outlineDoneIcon => const SvgGeneralImage('module/resources/assets/icons/outline_done_icon.svg');

SvgGeneralImage get outlineErrorIcon => const SvgGeneralImage('module/resources/assets/icons/outline_error_icon.svg');

SvgGeneralImage get warningIcon => const SvgGeneralImage('module/resources/assets/icons/warning_icon.svg');


  /// List of all assets
  List<SvgGeneralImage> get values => [
        circleDoneIcon,
        errorIcon,
        outlineDoneIcon,
        outlineErrorIcon,
        warningIcon,
      ];
}


class SvgGeneralImage {
  const SvgGeneralImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      clipBehavior: clipBehavior,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
