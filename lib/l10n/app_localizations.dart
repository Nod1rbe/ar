import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uz'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In uz, this message translates to:
  /// **'Maktab AR'**
  String get appTitle;

  /// No description provided for @homeTitle.
  ///
  /// In uz, this message translates to:
  /// **'AR Maktab Ilovasi'**
  String get homeTitle;

  /// No description provided for @dataNotFound.
  ///
  /// In uz, this message translates to:
  /// **'Ma\'lumot topilmadi'**
  String get dataNotFound;

  /// No description provided for @loading.
  ///
  /// In uz, this message translates to:
  /// **'Yuklanmoqda...'**
  String get loading;

  /// No description provided for @biology.
  ///
  /// In uz, this message translates to:
  /// **'Biologiya'**
  String get biology;

  /// No description provided for @astronomy.
  ///
  /// In uz, this message translates to:
  /// **'Astronomiya'**
  String get astronomy;

  /// No description provided for @physics.
  ///
  /// In uz, this message translates to:
  /// **'Fizika'**
  String get physics;

  /// No description provided for @chemistry.
  ///
  /// In uz, this message translates to:
  /// **'Kimyo'**
  String get chemistry;

  /// No description provided for @practice.
  ///
  /// In uz, this message translates to:
  /// **'Amaliyotlar'**
  String get practice;

  /// No description provided for @flowerGrowthTitle.
  ///
  /// In uz, this message translates to:
  /// **'Gul O\'sishi'**
  String get flowerGrowthTitle;

  /// No description provided for @flowerGrowthSub.
  ///
  /// In uz, this message translates to:
  /// **'Gulning urug\'dan unib chiqishi AR modelida'**
  String get flowerGrowthSub;

  /// No description provided for @beePollinationTitle.
  ///
  /// In uz, this message translates to:
  /// **'Changlantirish'**
  String get beePollinationTitle;

  /// No description provided for @beePollinationSub.
  ///
  /// In uz, this message translates to:
  /// **'Asalarining gullardan chang yig\'ishi'**
  String get beePollinationSub;

  /// No description provided for @heartPulseTitle.
  ///
  /// In uz, this message translates to:
  /// **'Yurak Urishi'**
  String get heartPulseTitle;

  /// No description provided for @heartPulseSub.
  ///
  /// In uz, this message translates to:
  /// **'Inson yuragi urish tezligini nazorat qilish'**
  String get heartPulseSub;

  /// No description provided for @xrayAnatomyTitle.
  ///
  /// In uz, this message translates to:
  /// **'X-Ray Anatomiyasi'**
  String get xrayAnatomyTitle;

  /// No description provided for @xrayAnatomySub.
  ///
  /// In uz, this message translates to:
  /// **'Tirik mavjudotning ichki organlari (Shaffof)'**
  String get xrayAnatomySub;

  /// No description provided for @atomStructureTitle.
  ///
  /// In uz, this message translates to:
  /// **'Atom Konstruktori'**
  String get atomStructureTitle;

  /// No description provided for @atomStructureSub.
  ///
  /// In uz, this message translates to:
  /// **'3D model atrofida elektronlar harakatini kuzating'**
  String get atomStructureSub;

  /// No description provided for @chemReactionTitle.
  ///
  /// In uz, this message translates to:
  /// **'Kimyoviy Reaksiya'**
  String get chemReactionTitle;

  /// No description provided for @chemReactionSub.
  ///
  /// In uz, this message translates to:
  /// **'Ikki xil modda elementlarini aralashtirish jarayoni'**
  String get chemReactionSub;

  /// No description provided for @solarSystemTitle.
  ///
  /// In uz, this message translates to:
  /// **'Quyosh Sistemasi'**
  String get solarSystemTitle;

  /// No description provided for @solarSystemSub.
  ///
  /// In uz, this message translates to:
  /// **'Sayyoralarning umumiy aylanish tezligini boshqaring'**
  String get solarSystemSub;

  /// No description provided for @lunarEclipseTitle.
  ///
  /// In uz, this message translates to:
  /// **'Oy Tutilishi'**
  String get lunarEclipseTitle;

  /// No description provided for @lunarEclipseSub.
  ///
  /// In uz, this message translates to:
  /// **'Yer, Oy va Quyosh nuring kesishishi simulyatsiyasi'**
  String get lunarEclipseSub;

  /// No description provided for @waterDrop.
  ///
  /// In uz, this message translates to:
  /// **'Suv quyish'**
  String get waterDrop;

  /// No description provided for @flowerGrowing.
  ///
  /// In uz, this message translates to:
  /// **'Gul o\'smoqda... (Scale o\'zgarishi)'**
  String get flowerGrowing;

  /// No description provided for @pollinateBtn.
  ///
  /// In uz, this message translates to:
  /// **'Changlantirish'**
  String get pollinateBtn;

  /// No description provided for @speedPulse.
  ///
  /// In uz, this message translates to:
  /// **'Tezlik: {rate} zarba / daq'**
  String speedPulse(int rate);

  /// No description provided for @xrayMode.
  ///
  /// In uz, this message translates to:
  /// **'X-Ray (Shaffof) Rejimi'**
  String get xrayMode;

  /// No description provided for @electronSpeed.
  ///
  /// In uz, this message translates to:
  /// **'Elektron harakat tezligi: {speed}'**
  String electronSpeed(int speed);

  /// No description provided for @mixChemicals.
  ///
  /// In uz, this message translates to:
  /// **'Aralashtirish (Reaksiya)'**
  String get mixChemicals;

  /// No description provided for @reactionHappening.
  ///
  /// In uz, this message translates to:
  /// **'Reaksiya ketmoqda! Olov yoki rang o\'zgarishi.'**
  String get reactionHappening;

  /// No description provided for @orbitSpeed.
  ///
  /// In uz, this message translates to:
  /// **'Aylanish tezligi: {speed} km/s'**
  String orbitSpeed(int speed);

  /// No description provided for @startEclipse.
  ///
  /// In uz, this message translates to:
  /// **'Tutilishni Boshlash'**
  String get startEclipse;

  /// No description provided for @eclipseHappening.
  ///
  /// In uz, this message translates to:
  /// **'Oy Quyosh va Yer o\'rtasidan aylanmoqda...'**
  String get eclipseHappening;

  /// No description provided for @modelLoading.
  ///
  /// In uz, this message translates to:
  /// **'Modelni chaqirish xona o\'rtasiga: \nInternetdan ({name}) yuklanmoqda...'**
  String modelLoading(String name);

  /// No description provided for @modelAdded.
  ///
  /// In uz, this message translates to:
  /// **'Model muvaffaqiyatli yuklandi!'**
  String get modelAdded;

  /// No description provided for @modelError.
  ///
  /// In uz, this message translates to:
  /// **'Modelni qo\'shib bo\'lmadi!'**
  String get modelError;

  /// No description provided for @settings.
  ///
  /// In uz, this message translates to:
  /// **'Sozlamalar'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In uz, this message translates to:
  /// **'Til'**
  String get language;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
