import 'package:flutter/material.dart';

import 'package:flutter_base_project/product/init/i10n/i10n.dart';
import 'package:flutter_base_project/product/utility/enums/project_padding.dart';
import 'package:resources/resources.dart';

/// Screen to show when called route is not exist
class UnknownRouteScreen extends StatelessWidget {
  /// Screen to show when called route is not exist
  const UnknownRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const IconAssets().outlineErrorIcon.svg(),
            SizedBox(height: ProjectPadding.m.value),
            Text(
              AppLocalization.getLabels.unknownPageRouteMessageText,
              style: context.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
