import 'package:flutter_base_project/product/init/i10n/default_localization.dart';

///Localization File For English - EN
class EnLocalization extends AppLocalizationLabel {

  @override
  final String lanCode = 'en';

  @override
  final String localizationTitle = 'English';

  @override
  final String defaultErrorMessage =
      'An error occurred. Please try again later';

  @override
  final String noInternetErrorMessage =
      'Please check your internet connection.';

  @override
  final String unauthorizedErrorMessage =
      'You do not have the authority for this operation.';

  @override
  final String serverErrorMessage =
      'A server-related error occurred. Please try again later';

  @override
  final String cancelBtnText = 'Cancel';

  @override
  final String tryAgainBtnText = 'Try Again';

  @override
  final String unknownPageRouteMessageText = 'You should not be here :)';

  @override
  String get timeoutErrorMessage => 'The connection has timed out';
}
