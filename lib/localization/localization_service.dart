import 'dart:io' as plat;
import 'package:news_app/news_module/Filter/FilterRequest.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../hive/hive.dart';

class LocalizationService {
  static final PublishSubject<String> _localizationSubject =
      PublishSubject<String>();
  Stream<String> get localizationStream => _localizationSubject.stream;

  LocalizationService();

  LanguageHelper _preferencesHelper = LanguageHelper();
  void setLanguage(String lang) {
    _preferencesHelper.setLanguage(lang);
    _localizationSubject.add(lang);
  }

  String getLanguage() {
    String? lang = _preferencesHelper.getLanguage();
    if (kIsWeb) {
      lang ??= 'en';
    } else {
      lang ??= plat.Platform.localeName.substring(0, 2);
    }
    return lang;
  }

  bool choosed() {
    String? lang = _preferencesHelper.getLanguage();
    return lang != null;
  }

  void dispose() {
    _localizationSubject.close();
  }
}
