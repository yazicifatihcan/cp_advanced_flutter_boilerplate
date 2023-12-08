import 'package:flutter/material.dart';
import 'package:flutter_base_project/product/init/i10n/i10n.dart';
import 'package:flutter_base_project/product/utility/enums/project_padding.dart';
import 'package:resources/resources.dart';

class GeneralErrorView extends StatelessWidget {
  final String? message;
  final String? btnText;
  final VoidCallback? onTapTryAgain;
  const GeneralErrorView({
    super.key,
    this.message,
    this.onTapTryAgain,
    this.btnText,
  });

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
          SizedBox(height: ProjectPadding.medium.value),
          Text(message ?? AppLocalization.getLabels.defaultErrorMessage, style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: ProjectPadding.medium.value),
          SizedBox(
                  height: 56,
                  child: ElevatedButton(
                      onPressed: onTapTryAgain, child: Text(btnText ?? AppLocalization.getLabels.tryAgainBtnText),),)
              .isVisible(onTapTryAgain != null),
        ],
      ),
    );
  }
}
