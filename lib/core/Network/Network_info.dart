import 'dart:ui';

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}
class NetworkInfoImpl implements NetworkInfo{
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);
  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => connectionChecker.hasConnection;
}

Locale localeCallBack(Locale? locale, Iterable<Locale> supportedLocales) {
  if (locale == null) {
    return supportedLocales.last;
  }

  for (var supportedLocale in supportedLocales) {
    if (locale.languageCode == supportedLocale.languageCode) {
      return supportedLocale;
    }
  }

  // If no match is found, you might want to return a default locale or the first supported locale.
  return supportedLocales.last;
}
