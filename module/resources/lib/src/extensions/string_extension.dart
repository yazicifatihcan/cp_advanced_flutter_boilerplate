import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

/// Flutter extension for the [String] class, providing
/// additional functionalities
/// for working with strings, launching URLs, and rendering SVG images.
extension StringExtension on String {
  /// Launches a web link using the URL launcher. This extension parses the
  /// current string as a URL and attempts to launch it. Any errors during the
  /// launch process are caught and printed to the debug console.
  Future<void> launchLink() async {
    try {
      final url = Uri.parse(this);
      await launchUrl(url);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Converts the string to an SVG image widget.
  ///
  /// Parameters:
  /// - [height]: The height of the SVG image.
  /// - [width]: The width of the SVG image.
  /// - [color]: The color to apply to the SVG image.
  /// - [padding]: Padding to apply around the SVG image.
  Widget toSvg({
    double? height,
    double? width,
    Color? color,
    EdgeInsets? padding,
  }) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SvgPicture.asset(
        this,
        height: height,
        width: width,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(
                color,
                BlendMode.srcIn,
              ),
      ),
    );
  }
}
