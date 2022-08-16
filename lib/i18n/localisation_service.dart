import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LocalisationService {
  late final Locale locale;

  LocalisationService(this.locale);

  static LocalisationService of(BuildContext context) {
    return Localizations.of(context, LocalisationService);
  }

  late Map<String, String> _localizedString;

  Future<void> load() async {
    final jsonString =
        await rootBundle.loadString("i18n/${locale.languageCode}.json");

    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    _localizedString =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String? translate(String key) {
    return _localizedString[key];
  }

  static const supportedLocales = [Locale("en", "US"), Locale("ta", "IN")];
  static Locale? localeResolutionCallBack(
      Locale? locale, Iterable<Locale>? supportedLocales) {
    if (supportedLocales != null && locale != null) {
      return supportedLocales.firstWhere(
          (element) => element.languageCode == locale.languageCode,
          orElse: () => supportedLocales.first);
    }
    return null;
  }

  static const LocalizationsDelegate<LocalisationService> _delegate =
      _LocalizationServiceDelegate();

  static const localizationsDelegate = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    _delegate
  ];
}

class _LocalizationServiceDelegate
    extends LocalizationsDelegate<LocalisationService> {
  const _LocalizationServiceDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "ta"].contains(locale.languageCode);
  }

  @override
  Future<LocalisationService> load(Locale locale) async {
    LocalisationService service = LocalisationService(locale);
    await service.load();
    return service;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<LocalisationService> old) {
    return false;
  }
}
