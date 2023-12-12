import 'package:flutter/material.dart';
import 'package:flutter_base_project/product/utility/enums/project_padding.dart';
import 'package:resources/resources.dart';
import 'package:widgets/widget.dart';

/// A custom implementation of [BaseMessageWidget] for displaying
///  styled toast messages.
class ModuleToastMessage extends BaseMessageWidget {
  /// Constructs a [ModuleToastMessage] with the required parameters.
  ///
  /// The [backgroundColor] is the background color of the message card.
  /// The [svg] is the SVG asset representing an icon
  /// associated with the message.
  const ModuleToastMessage({
    required this.backgroundColor,
    required this.svg, 
    super.key,
  });

  /// Creates a [ModuleToastMessage] with an error theme.
  factory ModuleToastMessage.error() {
    return ModuleToastMessage(
      backgroundColor:
          Colors.red,
      svg: const IconAssets().outlineDoneIcon.svg(height: 24,width: 24),
    );
  }

  /// Creates a [ModuleToastMessage] with a success theme.
  factory ModuleToastMessage.success() {
    return ModuleToastMessage(
      backgroundColor: Colors.green.withOpacity(0.5),
      svg: const IconAssets().circleDoneIcon.svg(height: 24,width: 24),
    );
  }

  /// Creates a [ModuleToastMessage] with a warning theme.
  factory ModuleToastMessage.warning() {
    return ModuleToastMessage(
      backgroundColor: const Color(0xffFFFCF2),
      svg: const IconAssets().warningIcon.svg(height: 24,width: 24),
    );
  }

  /// The background color of the message card.
  final Color backgroundColor;

  /// The SVG string representing an icon associated with the message.
  final Widget svg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ProjectPadding.xl.value),
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ProjectPadding.s.value),
        ),
        child: Padding(
          padding: EdgeInsets.all(ProjectPadding.s.value),
          child: Row(
            children: [
              svg,
              SizedBox(width: ProjectPadding.xl.value),
              Flexible(
                child: Text(
                  message ?? '',
                  maxLines: 2,
                  style: context.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  BaseMessageWidget copyWith({String? message}) {
    return ModuleToastMessage(
      backgroundColor: backgroundColor,
      svg: svg,
    );
  }
}
