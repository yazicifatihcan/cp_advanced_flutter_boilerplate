import 'package:flutter_base_project/app/managers/google_ads_manager/ad_types/ads_without_view/base_ads_without_view.dart';
import 'package:flutter_base_project/app/managers/google_ads_manager/constants/ad_constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppOpenAdService extends BaseAdsWithoutView<AppOpenAd> {
  
  @override
  Future<void> createAd() async {
    await AppOpenAd.load(
      adUnitId: getAdId(AdsType.APP_OPEN),
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: onAdLoaded, onAdFailedToLoad: onAdFailedToLoad),
      orientation: 1,
    );
  }

  @override
  Future<void> showAd() async {
    super.showAd();
    currentAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: onAdShowedFullScreenContent,
      onAdDismissedFullScreenContent: onAdDismissedFullScreenContent,
      onAdFailedToShowFullScreenContent: onAdFailedToShowFullScreenContent,
    );
    currentAd?.setImmersiveMode(true);

    await showAdAfterDelay(onAdIsValid: () => currentAd!.show());
  }
}
