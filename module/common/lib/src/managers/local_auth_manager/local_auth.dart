import 'package:local_auth/local_auth.dart';

class LocalAuthManager {
  LocalAuthManager._init();

  late final LocalAuthentication _localAuth;
  late final List<BiometricType> _availableBiometrics;

  static final LocalAuthManager _instance = LocalAuthManager._init();

  static LocalAuthManager get instance => _instance;

  static Future<void> initLocalAuthManager() async {
    instance._localAuth = LocalAuthentication();
    instance._availableBiometrics = await instance._localAuth.getAvailableBiometrics();
  }

  bool get isAnyBiometricAvailable => isFaceIdAvailable || isFingerPrintAvailable;
  bool get isFaceIdAvailable => _availableBiometrics.contains(BiometricType.face);
  bool get isFingerPrintAvailable => _availableBiometrics.contains(BiometricType.fingerprint);

  Future<bool> biometricAuth({required String authenticationReason}) async {
    try {
      return await instance._localAuth.authenticate(
        localizedReason: authenticationReason,
        options: const AuthenticationOptions(useErrorDialogs: false, biometricOnly: true),
      );
    } catch (_) {
      return false;
    }
  }
}
