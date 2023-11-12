import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/common/extensions/string_extension.dart';
import 'package:flutter_base_project/app/main/values/assets/assets.dart';
import 'package:flutter_base_project/app/utils/size/padding_and_radius.dart';
import 'package:flutter_base_project/app/utils/style/text_style.dart';
import 'package:flutter_base_project/core/i10n/i10n.dart';

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
