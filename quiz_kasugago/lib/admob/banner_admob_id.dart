import 'dart:io';

class BannerAdManager {
//  アプリIDを返す
  static String get appId {
    if (Platform.isAndroid) {
      return '';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-7286628319232085~4615317067';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return '';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-7286628319232085/6858337024';
    } else {
      throw new UnsupportedError('Unsupported Platform');
    }
  }
}
