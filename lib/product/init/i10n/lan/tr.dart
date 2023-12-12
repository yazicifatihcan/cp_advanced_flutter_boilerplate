import 'package:flutter_base_project/product/init/i10n/default_localization.dart';

///Localization File For Turkish - TR
class TrLocalization extends AppLocalizationLabel {
  @override
  final String lanCode = 'tr';
  @override
  final String localizationTitle = 'Türkçe';
  @override
  final String defaultErrorMessage =
      'Hata oluştu. Lütfen daha sonra tekrar deneyiniz';
  @override
  final String noInternetErrorMessage =
      'Lütfen internet bağlantınızı kontrol ediniz.';
  @override
  final String unauthorizedErrorMessage =
      'Bu işlem için yetkiniz bulunmamaktadır.';
  @override
  final String serverErrorMessage =
      'Sunucu kaynaklı bi hata oluştu. Lütfen daha sonra tekrar deneyiniz';
  @override
  final String cancelBtnText = 'İptal';
  @override
  final String tryAgainBtnText = 'Tekrar Dene';

  @override
  String get timeoutErrorMessage => 'Bağlantı zaman aşımına uğradı';

  @override
  String get unknownPageRouteMessageText => 'Burada olmaman gerek :)';
}
