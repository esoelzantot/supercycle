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

  /// `Contact Us`
  String get contact_us_title {
    return Intl.message(
      'Contact Us',
      name: 'contact_us_title',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us Now`
  String get contact_us_desc {
    return Intl.message(
      'Contact Us Now',
      name: 'contact_us_desc',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get contact_us_email {
    return Intl.message('Email', name: 'contact_us_email', desc: '', args: []);
  }

  /// `Phone`
  String get contact_us_phone {
    return Intl.message('Phone', name: 'contact_us_phone', desc: '', args: []);
  }

  /// `Social Media`
  String get contact_us_social {
    return Intl.message(
      'Social Media',
      name: 'contact_us_social',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get contact_us_name {
    return Intl.message(
      'Full Name',
      name: 'contact_us_name',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get contact_us_subject {
    return Intl.message(
      'Subject',
      name: 'contact_us_subject',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get contact_us_message {
    return Intl.message(
      'Message',
      name: 'contact_us_message',
      desc: '',
      args: [],
    );
  }

  /// `Send Message`
  String get send_msg_btn {
    return Intl.message(
      'Send Message',
      name: 'send_msg_btn',
      desc: '',
      args: [],
    );
  }

  /// `Send Message Confirmation`
  String get send_message_dialog_title {
    return Intl.message(
      'Send Message Confirmation',
      name: 'send_message_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Choose Sending Method`
  String get send_message_dialog_subtitle {
    return Intl.message(
      'Choose Sending Method',
      name: 'send_message_dialog_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Send via WhatsApp`
  String get send_message_dialog_whatsapp_option {
    return Intl.message(
      'Send via WhatsApp',
      name: 'send_message_dialog_whatsapp_option',
      desc: '',
      args: [],
    );
  }

  /// `Send via Email`
  String get send_message_dialog_email_option {
    return Intl.message(
      'Send via Email',
      name: 'send_message_dialog_email_option',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send_message_dialog_send_button {
    return Intl.message(
      'Send',
      name: 'send_message_dialog_send_button',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get send_message_dialog_cancel_button {
    return Intl.message(
      'Cancel',
      name: 'send_message_dialog_cancel_button',
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
