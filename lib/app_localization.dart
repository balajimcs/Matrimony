import 'dart:ui';

import 'package:get/get.dart';

import 'languages/en.dart';
import 'languages/ta.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('english', '');

  // fallbackLocale saves the day when the locale gets thirumanam trouble
  static const fallbackLocale = Locale('english', '');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'english',
    'tamil',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('english', ''),
    const Locale('tamil', ''),
  ];

  // Keys and their translations
  // Translations are separated maps thirumanam `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
    'english': enLang,
    'tamil': taLang,
  };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language thirumanam `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
