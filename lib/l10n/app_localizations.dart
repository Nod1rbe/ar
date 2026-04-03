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

  /// No description provided for @arTechnology.
  ///
  /// In uz, this message translates to:
  /// **'AR TEXNOLOGIYA'**
  String get arTechnology;

  /// No description provided for @schoolAppPart1.
  ///
  /// In uz, this message translates to:
  /// **'MAKTAB'**
  String get schoolAppPart1;

  /// No description provided for @schoolAppPart2.
  ///
  /// In uz, this message translates to:
  /// **'ILOVASI'**
  String get schoolAppPart2;

  /// No description provided for @learnWithAr.
  ///
  /// In uz, this message translates to:
  /// **'Kengaytirilgan haqiqat bilan o\'rganish'**
  String get learnWithAr;

  /// No description provided for @arReady.
  ///
  /// In uz, this message translates to:
  /// **'AR TAYYOR'**
  String get arReady;

  /// No description provided for @arGuide.
  ///
  /// In uz, this message translates to:
  /// **'3D obyektni aylantirishingiz va yaqinlashtirishingiz mumkin. \'AR\' rejimiga o\'tish uchun ekrandagi maxsus tugmani bosing.'**
  String get arGuide;

  /// No description provided for @subjectSection.
  ///
  /// In uz, this message translates to:
  /// **'Fan bo\'limi'**
  String get subjectSection;

  /// No description provided for @arActive.
  ///
  /// In uz, this message translates to:
  /// **'AR FAOL'**
  String get arActive;

  /// No description provided for @arStart.
  ///
  /// In uz, this message translates to:
  /// **'AR BOSHLASH'**
  String get arStart;

  /// No description provided for @astronomyDesc.
  ///
  /// In uz, this message translates to:
  /// **'Koinotni xonangizda kashf eting! AR orqali Quyosh sistemasi va yulduzlarni hayotiy o\'lchamda kuzating. Vaqt va makonni aql bilan o\'rganing.'**
  String get astronomyDesc;

  /// No description provided for @biologyDesc.
  ///
  /// In uz, this message translates to:
  /// **'Biologiya — tirik organizmlardagi hayot sirlarini AR texnologiyasi orqali 3D ko\'rinishda o\'rganasiz. Hujayra ichidagi murakkab jarayonlarni kuzating.'**
  String get biologyDesc;

  /// No description provided for @chemistryDesc.
  ///
  /// In uz, this message translates to:
  /// **'Kimyoviy moddalar, atomlar va molekulalarni AR yordamida 3D shaklda ko\'ring. Davriy jadval elementlarini interaktiv tarzda o\'rganing.'**
  String get chemistryDesc;

  /// No description provided for @physicsDesc.
  ///
  /// In uz, this message translates to:
  /// **'Fizika qonunlarini AR orqali real ko\'ring. Gravitatsiya, elektr, magnit va yorug\'lik kabi kuchlarni 3D simulatsiyalar orqali tushunasiz.'**
  String get physicsDesc;

  /// No description provided for @astronomyStat1.
  ///
  /// In uz, this message translates to:
  /// **'9'**
  String get astronomyStat1;

  /// No description provided for @astronomyStat1Label.
  ///
  /// In uz, this message translates to:
  /// **'Sayyora'**
  String get astronomyStat1Label;

  /// No description provided for @astronomyStat2.
  ///
  /// In uz, this message translates to:
  /// **'36'**
  String get astronomyStat2;

  /// No description provided for @astronomyStat2Label.
  ///
  /// In uz, this message translates to:
  /// **'AR Model'**
  String get astronomyStat2Label;

  /// No description provided for @astronomyStat3.
  ///
  /// In uz, this message translates to:
  /// **'360°'**
  String get astronomyStat3;

  /// No description provided for @astronomyStat3Label.
  ///
  /// In uz, this message translates to:
  /// **'Ko\'rinish'**
  String get astronomyStat3Label;

  /// No description provided for @biologyStat1.
  ///
  /// In uz, this message translates to:
  /// **'12'**
  String get biologyStat1;

  /// No description provided for @biologyStat1Label.
  ///
  /// In uz, this message translates to:
  /// **'Mavzu'**
  String get biologyStat1Label;

  /// No description provided for @biologyStat2.
  ///
  /// In uz, this message translates to:
  /// **'48'**
  String get biologyStat2;

  /// No description provided for @biologyStat2Label.
  ///
  /// In uz, this message translates to:
  /// **'AR Model'**
  String get biologyStat2Label;

  /// No description provided for @biologyStat3.
  ///
  /// In uz, this message translates to:
  /// **'3D'**
  String get biologyStat3;

  /// No description provided for @biologyStat3Label.
  ///
  /// In uz, this message translates to:
  /// **'Ko\'rinish'**
  String get biologyStat3Label;

  /// No description provided for @chemistryStat1.
  ///
  /// In uz, this message translates to:
  /// **'118'**
  String get chemistryStat1;

  /// No description provided for @chemistryStat1Label.
  ///
  /// In uz, this message translates to:
  /// **'Element'**
  String get chemistryStat1Label;

  /// No description provided for @chemistryStat2.
  ///
  /// In uz, this message translates to:
  /// **'54'**
  String get chemistryStat2;

  /// No description provided for @chemistryStat2Label.
  ///
  /// In uz, this message translates to:
  /// **'AR Model'**
  String get chemistryStat2Label;

  /// No description provided for @chemistryStat3.
  ///
  /// In uz, this message translates to:
  /// **'3D'**
  String get chemistryStat3;

  /// No description provided for @chemistryStat3Label.
  ///
  /// In uz, this message translates to:
  /// **'Molekula'**
  String get chemistryStat3Label;

  /// No description provided for @physicsStat1.
  ///
  /// In uz, this message translates to:
  /// **'15'**
  String get physicsStat1;

  /// No description provided for @physicsStat1Label.
  ///
  /// In uz, this message translates to:
  /// **'Mavzu'**
  String get physicsStat1Label;

  /// No description provided for @physicsStat2.
  ///
  /// In uz, this message translates to:
  /// **'62'**
  String get physicsStat2;

  /// No description provided for @physicsStat2Label.
  ///
  /// In uz, this message translates to:
  /// **'AR Model'**
  String get physicsStat2Label;

  /// No description provided for @physicsStat3.
  ///
  /// In uz, this message translates to:
  /// **'Real'**
  String get physicsStat3;

  /// No description provided for @physicsStat3Label.
  ///
  /// In uz, this message translates to:
  /// **'Simulatsiya'**
  String get physicsStat3Label;

  /// No description provided for @topicSun.
  ///
  /// In uz, this message translates to:
  /// **'Quyosh'**
  String get topicSun;

  /// No description provided for @topicPlanets.
  ///
  /// In uz, this message translates to:
  /// **'Sayyoralar'**
  String get topicPlanets;

  /// No description provided for @topicMoon.
  ///
  /// In uz, this message translates to:
  /// **'Oy fazalari'**
  String get topicMoon;

  /// No description provided for @topicStars.
  ///
  /// In uz, this message translates to:
  /// **'Yulduzlar'**
  String get topicStars;

  /// No description provided for @topicCell.
  ///
  /// In uz, this message translates to:
  /// **'Hujayra'**
  String get topicCell;

  /// No description provided for @topicDna.
  ///
  /// In uz, this message translates to:
  /// **'DNK'**
  String get topicDna;

  /// No description provided for @topicPlants.
  ///
  /// In uz, this message translates to:
  /// **'O\'simliklar'**
  String get topicPlants;

  /// No description provided for @topicAnimals.
  ///
  /// In uz, this message translates to:
  /// **'Hayvonlar'**
  String get topicAnimals;

  /// No description provided for @topicAtom.
  ///
  /// In uz, this message translates to:
  /// **'Atom'**
  String get topicAtom;

  /// No description provided for @topicBond.
  ///
  /// In uz, this message translates to:
  /// **'Bog\'lanish'**
  String get topicBond;

  /// No description provided for @topicReaction.
  ///
  /// In uz, this message translates to:
  /// **'Reaksiya'**
  String get topicReaction;

  /// No description provided for @topicTable.
  ///
  /// In uz, this message translates to:
  /// **'D. jadval'**
  String get topicTable;

  /// No description provided for @topicWaves.
  ///
  /// In uz, this message translates to:
  /// **'To\'lqinlar'**
  String get topicWaves;

  /// No description provided for @topicMagnet.
  ///
  /// In uz, this message translates to:
  /// **'Magnit'**
  String get topicMagnet;

  /// No description provided for @topicOptics.
  ///
  /// In uz, this message translates to:
  /// **'Optika'**
  String get topicOptics;

  /// No description provided for @topicMechanics.
  ///
  /// In uz, this message translates to:
  /// **'Mexanika'**
  String get topicMechanics;

  /// No description provided for @flowerAnatomy.
  ///
  /// In uz, this message translates to:
  /// **'Gul anatomiyasi'**
  String get flowerAnatomy;

  /// No description provided for @petal.
  ///
  /// In uz, this message translates to:
  /// **'Gultojibarg'**
  String get petal;

  /// No description provided for @petalDesc.
  ///
  /// In uz, this message translates to:
  /// **'Gulning rangli, barcha hasharotlarni jalb qiladigan qismi.'**
  String get petalDesc;

  /// No description provided for @stigma.
  ///
  /// In uz, this message translates to:
  /// **'Tumshukcha'**
  String get stigma;

  /// No description provided for @stigmaDesc.
  ///
  /// In uz, this message translates to:
  /// **'Urug\'chining yuqori qismi, changni qabul qiladi.'**
  String get stigmaDesc;

  /// No description provided for @style.
  ///
  /// In uz, this message translates to:
  /// **'Ustuncha'**
  String get style;

  /// No description provided for @styleDesc.
  ///
  /// In uz, this message translates to:
  /// **'Urug\'chining o\'rta qismi, tumshukchani tuguncha bilan bog\'laydi.'**
  String get styleDesc;

  /// No description provided for @ovary.
  ///
  /// In uz, this message translates to:
  /// **'Tuguncha'**
  String get ovary;

  /// No description provided for @ovaryDesc.
  ///
  /// In uz, this message translates to:
  /// **'Urug\'chining pastki kengaygan qismi, u yerda urug\'murtaklar joylashadi.'**
  String get ovaryDesc;

  /// No description provided for @ovule.
  ///
  /// In uz, this message translates to:
  /// **'Urug\'murtak'**
  String get ovule;

  /// No description provided for @ovuleDesc.
  ///
  /// In uz, this message translates to:
  /// **'Tuguncha ichidagi qism, u yerda urug\'lanish amalga oshadi.'**
  String get ovuleDesc;

  /// No description provided for @sepal.
  ///
  /// In uz, this message translates to:
  /// **'Kosachabarg'**
  String get sepal;

  /// No description provided for @sepalDesc.
  ///
  /// In uz, this message translates to:
  /// **'Gulning eng quyi, himoya qiluvchi yashil barglari.'**
  String get sepalDesc;

  /// No description provided for @anther.
  ///
  /// In uz, this message translates to:
  /// **'Changdon'**
  String get anther;

  /// No description provided for @antherDesc.
  ///
  /// In uz, this message translates to:
  /// **'Changchining yuqori qismi, unda chang donachalari yetiladi.'**
  String get antherDesc;

  /// No description provided for @stamen.
  ///
  /// In uz, this message translates to:
  /// **'Changchi'**
  String get stamen;

  /// No description provided for @stamenDesc.
  ///
  /// In uz, this message translates to:
  /// **'Gulning erkaklik ko\'payish organi.'**
  String get stamenDesc;

  /// No description provided for @filament.
  ///
  /// In uz, this message translates to:
  /// **'Changchi ipi'**
  String get filament;

  /// No description provided for @filamentDesc.
  ///
  /// In uz, this message translates to:
  /// **'Changdonni tutib turuvchi ingichka ip.'**
  String get filamentDesc;

  /// No description provided for @receptacle.
  ///
  /// In uz, this message translates to:
  /// **'Gulo\'rni'**
  String get receptacle;

  /// No description provided for @receptacleDesc.
  ///
  /// In uz, this message translates to:
  /// **'Gulning barcha qismlari birikadigan asosi.'**
  String get receptacleDesc;

  /// No description provided for @pedicel.
  ///
  /// In uz, this message translates to:
  /// **'Gulband'**
  String get pedicel;

  /// No description provided for @pedicelDesc.
  ///
  /// In uz, this message translates to:
  /// **'Gulni poyaga birlashtiruvchi qismi.'**
  String get pedicelDesc;

  /// No description provided for @cellAnatomy.
  ///
  /// In uz, this message translates to:
  /// **'Hujayra anatomiyasi'**
  String get cellAnatomy;

  /// No description provided for @nucleus.
  ///
  /// In uz, this message translates to:
  /// **'Yadro'**
  String get nucleus;

  /// No description provided for @nucleusDesc.
  ///
  /// In uz, this message translates to:
  /// **'Hujayraning boshqaruv markazi, unda irsiy ma\'lumot saqlanadi.'**
  String get nucleusDesc;

  /// No description provided for @mitochondria.
  ///
  /// In uz, this message translates to:
  /// **'Mitoxondriya'**
  String get mitochondria;

  /// No description provided for @mitochondriaDesc.
  ///
  /// In uz, this message translates to:
  /// **'Hujayraning energetik stansiyasi, ATF energiya ishlab chiqaradi.'**
  String get mitochondriaDesc;

  /// No description provided for @golgi.
  ///
  /// In uz, this message translates to:
  /// **'Goldji apparati'**
  String get golgi;

  /// No description provided for @golgiDesc.
  ///
  /// In uz, this message translates to:
  /// **'Oqsillarni saralaydi va kerakli joyga jo\'natadi.'**
  String get golgiDesc;

  /// No description provided for @reticulum.
  ///
  /// In uz, this message translates to:
  /// **'Endoplazmatik to\'r'**
  String get reticulum;

  /// No description provided for @reticulumDesc.
  ///
  /// In uz, this message translates to:
  /// **'Moddalarni tashish va sintez qilish kanallari tizimi.'**
  String get reticulumDesc;

  /// No description provided for @ribosome.
  ///
  /// In uz, this message translates to:
  /// **'Ribosoma'**
  String get ribosome;

  /// No description provided for @ribosomeDesc.
  ///
  /// In uz, this message translates to:
  /// **'Oqsil sintez qiluvchi kichik organoidlar.'**
  String get ribosomeDesc;

  /// No description provided for @vacuole.
  ///
  /// In uz, this message translates to:
  /// **'Vakuola'**
  String get vacuole;

  /// No description provided for @vacuoleDesc.
  ///
  /// In uz, this message translates to:
  /// **'Suv va ozuqa moddalarini saqlaydigan bo\'shliq.'**
  String get vacuoleDesc;

  /// No description provided for @lysosome.
  ///
  /// In uz, this message translates to:
  /// **'Lizosoma'**
  String get lysosome;

  /// No description provided for @lysosomeDesc.
  ///
  /// In uz, this message translates to:
  /// **'Hujayra ichidagi moddalarni parchalovchi organoid.'**
  String get lysosomeDesc;

  /// No description provided for @membrane.
  ///
  /// In uz, this message translates to:
  /// **'Membrana'**
  String get membrane;

  /// No description provided for @membraneDesc.
  ///
  /// In uz, this message translates to:
  /// **'Hujayrani tashqi muhitdan ajratib turuvchi himoya qobig\'i.'**
  String get membraneDesc;

  /// No description provided for @correct.
  ///
  /// In uz, this message translates to:
  /// **'To\'g\'ri!'**
  String get correct;

  /// No description provided for @wrong.
  ///
  /// In uz, this message translates to:
  /// **'Xato!'**
  String get wrong;

  /// No description provided for @next.
  ///
  /// In uz, this message translates to:
  /// **'Keyingisi'**
  String get next;

  /// No description provided for @finish.
  ///
  /// In uz, this message translates to:
  /// **'Tugatish'**
  String get finish;

  /// No description provided for @quizTitle.
  ///
  /// In uz, this message translates to:
  /// **'Hujayra qismlarini toping'**
  String get quizTitle;

  /// No description provided for @animalCell.
  ///
  /// In uz, this message translates to:
  /// **'Hayvon hujayrasi'**
  String get animalCell;

  /// No description provided for @plantCell.
  ///
  /// In uz, this message translates to:
  /// **'O\'simlik hujayrasi'**
  String get plantCell;

  /// No description provided for @score.
  ///
  /// In uz, this message translates to:
  /// **'Natija: {correct} / {total}'**
  String score(int correct, int total);

  /// No description provided for @motivationHigh.
  ///
  /// In uz, this message translates to:
  /// **'Ajoyib! Siz haqiqiy biologsiz! 🧬'**
  String get motivationHigh;

  /// No description provided for @motivationMed.
  ///
  /// In uz, this message translates to:
  /// **'Yaxshi natija! Yana bir bor urinib ko\'ring! 💪'**
  String get motivationMed;

  /// No description provided for @motivationLow.
  ///
  /// In uz, this message translates to:
  /// **'Hali o\'rganadigan narsalar ko\'p. Bo\'shashmang! 📚'**
  String get motivationLow;

  /// No description provided for @tryAgain.
  ///
  /// In uz, this message translates to:
  /// **'Qayta urinish'**
  String get tryAgain;

  /// No description provided for @finishSession.
  ///
  /// In uz, this message translates to:
  /// **'Tugalsh'**
  String get finishSession;
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
