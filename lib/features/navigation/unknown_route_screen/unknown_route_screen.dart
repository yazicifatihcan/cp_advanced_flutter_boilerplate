import 'package:flutter/material.dart';
import '../../../../module/common/lib/src/extensions/string_extension.dart';
import 'package:resources/src/assets/assets.dart';
import 'package:flutter_base_project/app/utils/size/padding_and_radius.dart';
import 'package:flutter_base_project/app/utils/style/text_style.dart';
import '../../../../module/core/lib/src/i10n/i10n.dart';

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
            const SizedBox(height: paddingM),
            Text(
              AppLocalization.getLabels.unknownPageRouteMessageText,
              style: s16W400Dark,
            ),
          ],
        ),
      ),
    );
  }
}
