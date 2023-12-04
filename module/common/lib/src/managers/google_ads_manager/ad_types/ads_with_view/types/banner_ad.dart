import 'package:flutter/material.dart';
import 'package:common/src/managers/google_ads_manager/ad_types/ads_with_view/ads_with_view_mixin.dart';
import 'package:common/src/managers/google_ads_manager/constants/ad_constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget with AdsWithViewMixin<BannerAd>{
  final AdSize size;
  BannerAdWidget({super.key,this.size=AdSize.banner});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {


  void createBannerAd() {
    widget.ad = BannerAd(
      size: widget.size,
      adUnitId: widget.getAdId(AdsType.BANNER),
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: widget.onAdLoaded,
        onAdFailedToLoad: widget.onAdFailedToLoad,
        onAdOpened: widget.onAdOpened,
        onAdClosed: widget.onAdClosed,
        onAdWillDismissScreen: widget.onAdWillDismissScreen,
      ),
    )..load();
  }

  @override
  void initState() {
    super.initState();
    createBannerAd();
  }

  @override
  void dispose() {
    widget.ad!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.ad!.size.width.toDouble(),
      height: widget.ad!.size.height.toDouble(),
      child: AdWidget(ad: widget.ad!),
    );
  }
}
