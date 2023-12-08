import 'package:flutter/material.dart';

import 'package:flutter_base_project/product/init/i10n/i10n.dart';
import 'package:flutter_base_project/product/utility/enums/project_padding.dart';
import 'package:resources/resources.dart';

/// Gidilmek istenilen ekran tanımlı değil ise Gösterilen ekran
class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            outlineErrorIcon.toSvg(),
            SizedBox(height: ProjectPadding.medium.value),
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
