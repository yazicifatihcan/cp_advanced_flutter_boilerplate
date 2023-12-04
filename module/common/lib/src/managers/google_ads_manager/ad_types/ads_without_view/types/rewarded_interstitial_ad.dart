import 'dart:developer';
import 'package:common/src/managers/google_ads_manager/ad_types/ads_without_view/base_ads_without_view.dart';
import 'package:common/src/managers/google_ads_manager/constants/ad_constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedInterstitialAdService extends BaseAdsWithoutView<RewardedInterstitialAd> {
  @override
  Future<void> createAd() async {
    await RewardedInterstitialAd.load(
      adUnitId: getAdId(AdsType.REWARDED_INTERSTITIAL),
      request: AdRequest(),
      rewardedInterstitialAdLoadCallback:
          RewardedInterstitialAdLoadCallback(onAdLoaded: onAdLoaded, onAdFailedToLoad: onAdFailedToLoad),
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

    showAdAfterDelay(
        onAdIsValid: () => currentAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
              log('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
            }));
  }
}
