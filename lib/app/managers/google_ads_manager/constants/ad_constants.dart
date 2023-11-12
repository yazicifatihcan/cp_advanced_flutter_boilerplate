import 'package:flutter_base_project/app/main/values/enum/general_enum.dart';

enum AdsType {
  APP_OPEN,
  BANNER,
  INTERSTITIAL,
  REWARDED,
  REWARDED_INTERSTITIAL,
  NATIVE_ADVANCED,
}

class AdsVariables {
  static final adUnitIds = {
    
    AdsType.APP_OPEN: {
      PlatformType.ANDROID: 'ca-app-pub-3940256099942544/3419835294',
      PlatformType.IOS: 'ca-app-pub-3940256099942544/3419835294',
    },

    AdsType.BANNER: {
      PlatformType.ANDROID: 'ca-app-pub-3940256099942544/6300978111',
      PlatformType.IOS: 'ca-app-pub-3940256099942544/6300978111',
    },

    AdsType.INTERSTITIAL: {
      PlatformType.ANDROID: 'ca-app-pub-3940256099942544/1033173712',
      PlatformType.IOS: 'ca-app-pub-3940256099942544/1033173712',
    },

    AdsType.REWARDED: {
      PlatformType.ANDROID: 'ca-app-pub-3940256099942544/5224354917',
      PlatformType.IOS: 'ca-app-pub-3940256099942544/5224354917',
    },

    AdsType.REWARDED_INTERSTITIAL: {
      PlatformType.ANDROID: 'ca-app-pub-3940256099942544/5354046379',
      PlatformType.IOS: 'ca-app-pub-3940256099942544/5354046379',
    },

    AdsType.NATIVE_ADVANCED: {
      PlatformType.ANDROID: 'ca-app-pub-3940256099942544/2247696110',
      PlatformType.IOS: 'ca-app-pub-3940256099942544/2247696110',
    },
  };
}