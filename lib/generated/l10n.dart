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

  /// `Unveiling a New Standard of Luxury in KSA`
  String get home_hero_title {
    return Intl.message(
      'Unveiling a New Standard of Luxury in KSA',
      name: 'home_hero_title',
      desc: '',
      args: [],
    );
  }

  /// `From curated hospitality services to exquisitely designed rooms, White Moon Hotel offers an unparalleled experience for discerning travelers.`
  String get home_hero_content {
    return Intl.message(
      'From curated hospitality services to exquisitely designed rooms, White Moon Hotel offers an unparalleled experience for discerning travelers.',
      name: 'home_hero_content',
      desc: '',
      args: [],
    );
  }

  /// `Explore Rooms & Suites`
  String get home_hero_button {
    return Intl.message(
      'Explore Rooms & Suites',
      name: 'home_hero_button',
      desc: '',
      args: [],
    );
  }

  /// `Our Exclusive Hospitality Venues`
  String get home_venues_section_title {
    return Intl.message(
      'Our Exclusive Hospitality Venues',
      name: 'home_venues_section_title',
      desc: '',
      args: [],
    );
  }

  /// `View All Venues`
  String get show_all_venues_button {
    return Intl.message(
      'View All Venues',
      name: 'show_all_venues_button',
      desc: '',
      args: [],
    );
  }

  /// `Elegantly Designed Accommodations`
  String get home_rooms_section_title {
    return Intl.message(
      'Elegantly Designed Accommodations',
      name: 'home_rooms_section_title',
      desc: '',
      args: [],
    );
  }

  /// `View All Rooms`
  String get show_all_rooms_button {
    return Intl.message(
      'View All Rooms',
      name: 'show_all_rooms_button',
      desc: '',
      args: [],
    );
  }

  /// `Why Travellers Trust Us`
  String get home_trust_section_title {
    return Intl.message(
      'Why Travellers Trust Us',
      name: 'home_trust_section_title',
      desc: '',
      args: [],
    );
  }

  /// `Where Luxury Meets Hospitality`
  String get venues_hero_title {
    return Intl.message(
      'Where Luxury Meets Hospitality',
      name: 'venues_hero_title',
      desc: '',
      args: [],
    );
  }

  /// `Discover our versatile venues designed with a touch of modern Arabian elegance, perfect for your business meetings or social gatherings`
  String get venues_hero_content {
    return Intl.message(
      'Discover our versatile venues designed with a touch of modern Arabian elegance, perfect for your business meetings or social gatherings',
      name: 'venues_hero_content',
      desc: '',
      args: [],
    );
  }

  /// `Luxury Rooms & Suites Designed for Your Comfort`
  String get rooms_hero_title {
    return Intl.message(
      'Luxury Rooms & Suites Designed for Your Comfort',
      name: 'rooms_hero_title',
      desc: '',
      args: [],
    );
  }

  /// `Experience the ultimate retreat in our elegantly appointed rooms. Whether for business or leisure, find your perfect sanctuary at White Moon Hotel`
  String get rooms_hero_content {
    return Intl.message(
      'Experience the ultimate retreat in our elegantly appointed rooms. Whether for business or leisure, find your perfect sanctuary at White Moon Hotel',
      name: 'rooms_hero_content',
      desc: '',
      args: [],
    );
  }

  /// `About the Place`
  String get venue_info_title {
    return Intl.message(
      'About the Place',
      name: 'venue_info_title',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get book_button {
    return Intl.message('Book Now', name: 'book_button', desc: '', args: []);
  }

  /// `Day`
  String get day_label {
    return Intl.message('Day', name: 'day_label', desc: '', args: []);
  }

  /// `Hour`
  String get hour_label {
    return Intl.message('Hour', name: 'hour_label', desc: '', args: []);
  }

  /// `Select Booking Date`
  String get day_select_label {
    return Intl.message(
      'Select Booking Date',
      name: 'day_select_label',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from_label {
    return Intl.message('From', name: 'from_label', desc: '', args: []);
  }

  /// `To`
  String get to_label {
    return Intl.message('To', name: 'to_label', desc: '', args: []);
  }

  /// `Guests Number`
  String get guests_label {
    return Intl.message(
      'Guests Number',
      name: 'guests_label',
      desc: '',
      args: [],
    );
  }

  /// `Started from`
  String get price_label {
    return Intl.message(
      'Started from',
      name: 'price_label',
      desc: '',
      args: [],
    );
  }

  /// `Hour / Guest`
  String get price_quote {
    return Intl.message(
      'Hour / Guest',
      name: 'price_quote',
      desc: '',
      args: [],
    );
  }

  /// `Select a date and time to view the price`
  String get breakdown_place_holder {
    return Intl.message(
      'Select a date and time to view the price',
      name: 'breakdown_place_holder',
      desc: '',
      args: [],
    );
  }

  /// `No payment is required now. Pay only upon arrival, subject to availability`
  String get breakdown_guest_info {
    return Intl.message(
      'No payment is required now. Pay only upon arrival, subject to availability',
      name: 'breakdown_guest_info',
      desc: '',
      args: [],
    );
  }

  /// `Guests`
  String get people_label {
    return Intl.message('Guests', name: 'people_label', desc: '', args: []);
  }

  /// `Guest`
  String get person_label {
    return Intl.message('Guest', name: 'person_label', desc: '', args: []);
  }

  /// `Service Fee`
  String get fee_label {
    return Intl.message('Service Fee', name: 'fee_label', desc: '', args: []);
  }

  /// `Total`
  String get total_label {
    return Intl.message('Total', name: 'total_label', desc: '', args: []);
  }

  /// `Duration`
  String get period_label {
    return Intl.message('Duration', name: 'period_label', desc: '', args: []);
  }

  /// `Night / Guest`
  String get room_price_quote {
    return Intl.message(
      'Night / Guest',
      name: 'room_price_quote',
      desc: '',
      args: [],
    );
  }

  /// `Arrival Date`
  String get check_in_label {
    return Intl.message(
      'Arrival Date',
      name: 'check_in_label',
      desc: '',
      args: [],
    );
  }

  /// `Departure Date`
  String get check_out_label {
    return Intl.message(
      'Departure Date',
      name: 'check_out_label',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get select_date_label {
    return Intl.message(
      'Select Date',
      name: 'select_date_label',
      desc: '',
      args: [],
    );
  }

  /// `Rooms`
  String get rooms_label {
    return Intl.message('Rooms', name: 'rooms_label', desc: '', args: []);
  }

  /// `Room`
  String get room_label {
    return Intl.message('Room', name: 'room_label', desc: '', args: []);
  }

  /// `Night`
  String get night_label {
    return Intl.message('Night', name: 'night_label', desc: '', args: []);
  }

  /// `Nights`
  String get nights_label {
    return Intl.message('Nights', name: 'nights_label', desc: '', args: []);
  }

  /// `Rooms Count`
  String get rooms_count_label {
    return Intl.message(
      'Rooms Count',
      name: 'rooms_count_label',
      desc: '',
      args: [],
    );
  }

  /// `Show Details`
  String get details_button {
    return Intl.message(
      'Show Details',
      name: 'details_button',
      desc: '',
      args: [],
    );
  }

  /// `SAR`
  String get currency_symbol {
    return Intl.message('SAR', name: 'currency_symbol', desc: '', args: []);
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
