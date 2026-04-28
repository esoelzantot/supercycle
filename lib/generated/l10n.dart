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

  /// `Super Cycle App: The Ultimate Solution for Cardboard and Paper Trade Management.`
  String get hero_title {
    return Intl.message(
      'Super Cycle App: The Ultimate Solution for Cardboard and Paper Trade Management.',
      name: 'hero_title',
      desc: '',
      args: [],
    );
  }

  /// `Transform your business into an integrated digital system with a single touch. Super Cycle app empowers suppliers and traders to track real-time market prices, organize supply cycles, and maximize profits directly from your smartphone.`
  String get hero_desc {
    return Intl.message(
      'Transform your business into an integrated digital system with a single touch. Super Cycle app empowers suppliers and traders to track real-time market prices, organize supply cycles, and maximize profits directly from your smartphone.',
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

  /// `We are here to support your business success. Whether you need technical assistance or want to explore partnership opportunities, our dedicated team is ready to address all your inquiries.`
  String get contact_us_desc {
    return Intl.message(
      'We are here to support your business success. Whether you need technical assistance or want to explore partnership opportunities, our dedicated team is ready to address all your inquiries.',
      name: 'contact_us_desc',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get contact_us_email {
    return Intl.message('Email', name: 'contact_us_email', desc: '', args: []);
  }

  /// `Enter your email here`
  String get contact_us_email_hint {
    return Intl.message(
      'Enter your email here',
      name: 'contact_us_email_hint',
      desc: '',
      args: [],
    );
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

  /// `Enter your full name here`
  String get contact_us_name_hint {
    return Intl.message(
      'Enter your full name here',
      name: 'contact_us_name_hint',
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

  /// `Choose a subject`
  String get contact_us_subject_hint {
    return Intl.message(
      'Choose a subject',
      name: 'contact_us_subject_hint',
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

  /// `How can we support your business today`
  String get contact_us_message_hint {
    return Intl.message(
      'How can we support your business today',
      name: 'contact_us_message_hint',
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

  /// `Message Sent`
  String get msg_sent_btn {
    return Intl.message(
      'Message Sent',
      name: 'msg_sent_btn',
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

  /// `The premier app dedicated to organizing and advancing the cardboard and paper trade. We connect suppliers with major factories to ensure a smart, transparent, and sustainable trading cycle.`
  String get footer_brief {
    return Intl.message(
      'The premier app dedicated to organizing and advancing the cardboard and paper trade. We connect suppliers with major factories to ensure a smart, transparent, and sustainable trading cycle.',
      name: 'footer_brief',
      desc: '',
      args: [],
    );
  }

  /// `Get the App`
  String get footer_download_app {
    return Intl.message(
      'Get the App',
      name: 'footer_download_app',
      desc: '',
      args: [],
    );
  }

  /// `© 2026 Super Cycle. All rights reserved.`
  String get footer_Copyright {
    return Intl.message(
      '© 2026 Super Cycle. All rights reserved.',
      name: 'footer_Copyright',
      desc: '',
      args: [],
    );
  }

  /// `Get Ready to Transform Your Trade`
  String get app_waiting_dialog_title {
    return Intl.message(
      'Get Ready to Transform Your Trade',
      name: 'app_waiting_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `SOON`
  String get app_waiting_dialog_badge {
    return Intl.message(
      'SOON',
      name: 'app_waiting_dialog_badge',
      desc: '',
      args: [],
    );
  }

  /// `Super Cycle is in its final stages to bring you a smarter and faster trading experience. Stay tuned, we’re launching soon!`
  String get app_waiting_dialog_body {
    return Intl.message(
      'Super Cycle is in its final stages to bring you a smarter and faster trading experience. Stay tuned, we’re launching soon!',
      name: 'app_waiting_dialog_body',
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
