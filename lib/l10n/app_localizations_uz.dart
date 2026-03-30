// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get appTitle => 'Maktab AR';

  @override
  String get homeTitle => 'AR Maktab Ilovasi';

  @override
  String get dataNotFound => 'Ma\'lumot topilmadi';

  @override
  String get loading => 'Yuklanmoqda...';

  @override
  String get biology => 'Biologiya';

  @override
  String get astronomy => 'Astronomiya';

  @override
  String get physics => 'Fizika';

  @override
  String get chemistry => 'Kimyo';

  @override
  String get practice => 'Amaliyotlar';

  @override
  String get flowerGrowthTitle => 'Gul O\'sishi';

  @override
  String get flowerGrowthSub => 'Gulning urug\'dan unib chiqishi AR modelida';

  @override
  String get beePollinationTitle => 'Changlantirish';

  @override
  String get beePollinationSub => 'Asalarining gullardan chang yig\'ishi';

  @override
  String get heartPulseTitle => 'Yurak Urishi';

  @override
  String get heartPulseSub => 'Inson yuragi urish tezligini nazorat qilish';

  @override
  String get xrayAnatomyTitle => 'X-Ray Anatomiyasi';

  @override
  String get xrayAnatomySub => 'Tirik mavjudotning ichki organlari (Shaffof)';

  @override
  String get atomStructureTitle => 'Atom Konstruktori';

  @override
  String get atomStructureSub =>
      '3D model atrofida elektronlar harakatini kuzating';

  @override
  String get chemReactionTitle => 'Kimyoviy Reaksiya';

  @override
  String get chemReactionSub =>
      'Ikki xil modda elementlarini aralashtirish jarayoni';

  @override
  String get solarSystemTitle => 'Quyosh Sistemasi';

  @override
  String get solarSystemSub =>
      'Sayyoralarning umumiy aylanish tezligini boshqaring';

  @override
  String get lunarEclipseTitle => 'Oy Tutilishi';

  @override
  String get lunarEclipseSub =>
      'Yer, Oy va Quyosh nuring kesishishi simulyatsiyasi';

  @override
  String get waterDrop => 'Suv quyish';

  @override
  String get flowerGrowing => 'Gul o\'smoqda... (Scale o\'zgarishi)';

  @override
  String get pollinateBtn => 'Changlantirish';

  @override
  String speedPulse(int rate) {
    return 'Tezlik: $rate zarba / daq';
  }

  @override
  String get xrayMode => 'X-Ray (Shaffof) Rejimi';

  @override
  String electronSpeed(int speed) {
    return 'Elektron harakat tezligi: $speed';
  }

  @override
  String get mixChemicals => 'Aralashtirish (Reaksiya)';

  @override
  String get reactionHappening =>
      'Reaksiya ketmoqda! Olov yoki rang o\'zgarishi.';

  @override
  String orbitSpeed(int speed) {
    return 'Aylanish tezligi: $speed km/s';
  }

  @override
  String get startEclipse => 'Tutilishni Boshlash';

  @override
  String get eclipseHappening => 'Oy Quyosh va Yer o\'rtasidan aylanmoqda...';

  @override
  String modelLoading(String name) {
    return 'Modelni chaqirish xona o\'rtasiga: \nInternetdan ($name) yuklanmoqda...';
  }

  @override
  String get modelAdded => 'Model muvaffaqiyatli yuklandi!';

  @override
  String get modelError => 'Modelni qo\'shib bo\'lmadi!';

  @override
  String get settings => 'Sozlamalar';

  @override
  String get language => 'Til';
}
