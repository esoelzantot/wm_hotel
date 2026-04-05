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

  /// `White Moon Hotel`
  String get hotel_name {
    return Intl.message(
      'White Moon Hotel',
      name: 'hotel_name',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home_tab {
    return Intl.message('Home', name: 'home_tab', desc: '', args: []);
  }

  /// `Places`
  String get places_tab {
    return Intl.message('Places', name: 'places_tab', desc: '', args: []);
  }

  /// `Rooms`
  String get rooms_tab {
    return Intl.message('Rooms', name: 'rooms_tab', desc: '', args: []);
  }

  /// `Services`
  String get services_tab {
    return Intl.message('Services', name: 'services_tab', desc: '', args: []);
  }

  /// `About Us`
  String get about_us_tab {
    return Intl.message('About Us', name: 'about_us_tab', desc: '', args: []);
  }

  /// `Contact Now`
  String get contact_now_btn {
    return Intl.message(
      'Contact Now',
      name: 'contact_now_btn',
      desc: '',
      args: [],
    );
  }

  /// `Your Ultimate Gateway to Comfort in KSA`
  String get footer_hotel_brief_title {
    return Intl.message(
      'Your Ultimate Gateway to Comfort in KSA',
      name: 'footer_hotel_brief_title',
      desc: '',
      args: [],
    );
  }

  /// `Experience the perfect blend of luxury and Arabian hospitality at White Moon Hotel, Saudi Arabia. We offer a wide range of elegantly designed rooms and suites tailored to meet all your needs, complemented by premium hospitality facilities and world-class services. Whether you are visiting for business or leisure, White Moon is dedicated to making every moment of your stay exceptional.`
  String get footer_hotel_brief_content {
    return Intl.message(
      'Experience the perfect blend of luxury and Arabian hospitality at White Moon Hotel, Saudi Arabia. We offer a wide range of elegantly designed rooms and suites tailored to meet all your needs, complemented by premium hospitality facilities and world-class services. Whether you are visiting for business or leisure, White Moon is dedicated to making every moment of your stay exceptional.',
      name: 'footer_hotel_brief_content',
      desc: '',
      args: [],
    );
  }

  /// `Quick Links`
  String get footer_quick_links_column {
    return Intl.message(
      'Quick Links',
      name: 'footer_quick_links_column',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get footer_contact_us_column {
    return Intl.message(
      'Contact Us',
      name: 'footer_contact_us_column',
      desc: '',
      args: [],
    );
  }

  /// `© 2026 White Moon Hotel Website. All rights reserved.`
  String get footer_copy_right {
    return Intl.message(
      '© 2026 White Moon Hotel Website. All rights reserved.',
      name: 'footer_copy_right',
      desc: '',
      args: [],
    );
  }

  /// `Developed by `
  String get footer_developed_by {
    return Intl.message(
      'Developed by ',
      name: 'footer_developed_by',
      desc: '',
      args: [],
    );
  }

  /// `AXURAA`
  String get footer_company_name {
    return Intl.message(
      'AXURAA',
      name: 'footer_company_name',
      desc: '',
      args: [],
    );
  }

  /// `. Powered by Flutter.`
  String get footer_powered_by {
    return Intl.message(
      '. Powered by Flutter.',
      name: 'footer_powered_by',
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
