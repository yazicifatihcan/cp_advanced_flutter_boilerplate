import 'dart:developer';
import 'dart:io';

import 'package:flutter_base_project/app/main/values/enum/general_enum.dart';
import 'package:flutter_base_project/app/managers/google_ads_manager/constants/ad_constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

mixin AdsWithViewMixin<T extends AdWithView> {
  T? ad;

  String getAdId(AdsType type) {
    if (Platform.isAndroid) {
      return AdsVariables.adUnitIds[type]![PlatformType.ANDROID]!;
    } else if (Platform.isIOS) {
      return AdsVariables.adUnitIds[type]![PlatformType.IOS]!;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  void createAd() {}

  void onAdLoaded(Ad ad) => log('${ad.runtimeType} loaded.');

  void onAdOpened(Ad ad) => log('${ad.runtimeType} opened.');

  void onAdClosed(Ad ad) {
    log('${ad.runtimeType} closed');
    ad.dispose();
    createAd();
    log('${ad.runtimeType} reloaded');
  }

  void onAdFailedToLoad (Ad ad, LoadAdError error) =>log('${ad.runtimeType} failed to load: $error');

  void onAdWillDismissScreen(ad) => log('${ad.runtimeType} will dismiss.');
}
