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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Vision`
  String get vision_tab {
    return Intl.message('Vision', name: 'vision_tab', desc: '', args: []);
  }

  /// `Mission`
  String get mission_tab {
    return Intl.message('Mission', name: 'mission_tab', desc: '', args: []);
  }

  /// `Story`
  String get story_tab {
    return Intl.message('Story', name: 'story_tab', desc: '', args: []);
  }

  /// `Contact`
  String get contact_tab {
    return Intl.message('Contact', name: 'contact_tab', desc: '', args: []);
  }

  /// `Language`
  String get lang_btn {
    return Intl.message('Language', name: 'lang_btn', desc: '', args: []);
  }

  /// `Contact Us`
  String get contact_us_btn {
    return Intl.message(
      'Contact Us',
      name: 'contact_us_btn',
      desc: '',
      args: [],
    );
  }

  /// `Download Now`
  String get download_btn {
    return Intl.message(
      'Download Now',
      name: 'download_btn',
      desc: '',
      args: [],
    );
  }

  /// `The Ultimate Platform for Recycling Trade Management`
  String get hero_title {
    return Intl.message(
      'The Ultimate Platform for Recycling Trade Management',
      name: 'hero_title',
      desc: '',
      args: [],
    );
  }

  /// `Super Cycle bridges the gap between traders, suppliers, and delegates. Streamline your operations, track real-time prices, and digitize your waste trading business for maximum efficiency`
  String get hero_desc {
    return Intl.message(
      'Super Cycle bridges the gap between traders, suppliers, and delegates. Streamline your operations, track real-time prices, and digitize your waste trading business for maximum efficiency',
      name: 'hero_desc',
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
