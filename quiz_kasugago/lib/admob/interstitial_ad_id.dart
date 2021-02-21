import 'dart:io';

class InterstitialAdManager {
  static String get appId {
    if (Platform.isAndroid) {
      return '';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-7286628319232085~4615317067';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return '';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-7286628319232085/2784194796';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}
