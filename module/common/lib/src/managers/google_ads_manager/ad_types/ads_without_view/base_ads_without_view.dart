import 'dart:developer';
import 'dart:io';
import 'package:resources/src/enum/general_enum.dart';
import 'package:common/src/managers/google_ads_manager/constants/ad_constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class BaseAdsWithoutView<T extends AdWithoutView> {
  
  T? currentAd;
  int _currentNumberOfAttempt = 0;
  int maxAttemptCount = 3;

  String getAdId(AdsType type) {
    if (Platform.isAndroid) {
      return AdsVariables.adUnitIds[type]![PlatformType.ANDROID]!;
    } else if (Platform.isIOS) {
      return AdsVariables.adUnitIds[type]![PlatformType.IOS]!;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  Future<void> createAd() async {}

  void onAdLoaded(T ad) {
    log('$ad loaded');
    currentAd = ad;
    _currentNumberOfAttempt = 0;
    currentAd!.setImmersiveMode(true);
  }

  void onAdFailedToLoad(LoadAdError error) {
    _currentNumberOfAttempt++;
    currentAd = null;
    log('[ERROR]-$error -----  [Attempt] - $_currentNumberOfAttempt.');
    if (_currentNumberOfAttempt < maxAttemptCount) {
      createAd();
    }
  }

  void onAdShowedFullScreenContent(T ad) {
    log('$ad onAdShowedFullScreenContent.');
  }

  void onAdDismissedFullScreenContent(T ad) {
    log('$ad onAdDismissedFullScreenContent.');
    ad.dispose();
    createAd();
  }

  void onAdFailedToShowFullScreenContent(T ad, AdError error) {
    log('$ad onAdFailedToShowFullScreenContent: $error');
    ad.dispose();
    createAd();
  }

  Future<void> showAd() async {
    await createAd();
    if (currentAd == null) {
      log('Warning: attempt to show rewarded before loaded.');
      return;
    }
  }

  Future<void> showAdAfterDelay({required Function onAdIsValid}) async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (currentAd != null) {
        onAdIsValid();
      } else {
        log('Warning: attempt to show interstitial before loaded.');
      }
    });
  }
}
