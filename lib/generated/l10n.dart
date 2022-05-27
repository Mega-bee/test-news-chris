// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Popular`
  String get Popular {
    return Intl.message(
      'Popular',
      name: 'Popular',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get NEWS {
    return Intl.message(
      'News',
      name: 'NEWS',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get NEWS1 {
    return Intl.message(
      'News',
      name: 'NEWS1',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To Live`
  String get WelcomeToLive {
    return Intl.message(
      'Welcome To Live',
      name: 'WelcomeToLive',
      desc: '',
      args: [],
    );
  }

  /// `TO`
  String get TO {
    return Intl.message(
      'TO',
      name: 'TO',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get LOGIN {
    return Intl.message(
      'Log In',
      name: 'LOGIN',
      desc: '',
      args: [],
    );
  }

  /// `Required *`
  String get Required {
    return Intl.message(
      'Required *',
      name: 'Required',
      desc: '',
      args: [],
    );
  }

  /// `Not a valid Key`
  String get NotavalidKey {
    return Intl.message(
      'Not a valid Key',
      name: 'NotavalidKey',
      desc: '',
      args: [],
    );
  }

  /// `FROM`
  String get FROM {
    return Intl.message(
      'FROM',
      name: 'FROM',
      desc: '',
      args: [],
    );
  }

  /// `Search By Date`
  String get SearchByDate {
    return Intl.message(
      'Search By Date',
      name: 'SearchByDate',
      desc: '',
      args: [],
    );
  }

  /// `languages`
  String get languages {
    return Intl.message(
      'languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `white`
  String get white {
    return Intl.message(
      'white',
      name: 'white',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message(
      'Yes',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get No {
    return Intl.message(
      'No',
      name: 'No',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
