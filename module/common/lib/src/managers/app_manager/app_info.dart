import 'package:package_info_plus/package_info_plus.dart' as package;


///This class returns app informations.
///appName, packageName, version, buildNumber, buildSignature,deviceId
class AppInfo {

  AppInfo._init();

  static final AppInfo _instance = AppInfo._init();

  /// Returns instance for [AppInfo]
  static AppInfo get instance => _instance;

  /// The app name. `CFBundleDisplayName` on iOS, `application/label` on Android.
  late final String appName;

  /// The package name. `bundleIdentifier` on iOS, `getPackageName` on Android.
  late final String packageName;

  /// The package version. `CFBundleShortVersionString` on iOS, 
  /// `versionName` on Android.
  late final String version;

  /// The build number. `CFBundleVersion` on iOS, `versionCode` on Android.
  late final String buildNumber;

  /// The build signature. Empty string on iOS, signing key signature (hex) 
  /// on Android.
  late final String buildSignature;

  /// Unique UUID value identifying the current device.
  late final String deviceId;

  /// Sets the current app info values. You have to call this once function 
  /// before using any of its variable. It throws error if you call twice.
  static Future<void> init() async {
    await _instance._getPackageInfo();
  }

  Future<void> _getPackageInfo() async {
    final info = await package.PackageInfo.fromPlatform();
    version = info.version;
    buildNumber = info.buildNumber;
    appName = info.appName;
    packageName = info.packageName;
    buildSignature = info.buildSignature;
  }

}
