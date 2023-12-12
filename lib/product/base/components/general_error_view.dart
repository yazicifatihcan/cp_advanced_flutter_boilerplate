import 'package:flutter/material.dart';
import 'package:flutter_base_project/product/init/i10n/i10n.dart';
import 'package:flutter_base_project/product/utility/enums/project_padding.dart';
import 'package:resources/resources.dart';

///General Error View
class GeneralErrorView extends StatelessWidget {
  ///General Error View
  const GeneralErrorView({
    super.key,
    this.message,
    this.onTapTryAgain,
    this.btnText,
  });

  ///Message to display on screen.
  ///[AppLocalization.getLabels.defaultErrorMessage] if null
  final String? message;

  ///Text to display on button.
  ///[AppLocalization.getLabels.tryAgainText] if null
  final String? btnText;

  ///Function to call when button tapped.
  ///Button is unvisible if null.
  final VoidCallback? onTapTryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Theme.of(context).colorScheme.error,
          ),
          SizedBox(height: ProjectPadding.m.value),
          Text(
            message ?? AppLocalization.getLabels.defaultErrorMessage,
            style: context.bodyLarge,
          ),
          SizedBox(height: ProjectPadding.m.value),
          SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: onTapTryAgain,
              child: Text(btnText ?? AppLocalization.getLabels.tryAgainBtnText),
            ),
          ).isVisible(value:onTapTryAgain != null),
        ],
      ),
    );
  }
}
