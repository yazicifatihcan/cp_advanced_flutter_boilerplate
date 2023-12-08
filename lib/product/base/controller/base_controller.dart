import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/product/init/i10n/i10n.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

abstract class BaseControllerInterface extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext get context => scaffoldKey.currentContext!;

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<String?> _errorMessage = Rx(null);

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  String? get errorMessage => _errorMessage.value;
  set errorMessage(String? value) => _errorMessage.value = value;

  Future<void> onReadyGeneric(Function onReadyFunction) async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      await onReadyFunction();
      loadingStatus = LoadingStatus.Loaded;
    } on AppException catch (e) {
      errorMessage = e.toString();
      loadingStatus = LoadingStatus.Error;
    } catch (e) {
      errorMessage = AppLocalization.getLabels.defaultErrorMessage;
      loadingStatus = LoadingStatus.Error;
    }
  }

  void unFocus() => FocusScope.of(context).unfocus();

  void onTapBack() => Navigator.pop(context);
}
