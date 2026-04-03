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

  @override
  String get arTechnology => 'AR TEXNOLOGIYA';

  @override
  String get schoolAppPart1 => 'MAKTAB';

  @override
  String get schoolAppPart2 => 'ILOVASI';

  @override
  String get learnWithAr => 'Kengaytirilgan haqiqat bilan o\'rganish';

  @override
  String get arReady => 'AR TAYYOR';

  @override
  String get arGuide =>
      '3D obyektni aylantirishingiz va yaqinlashtirishingiz mumkin. \'AR\' rejimiga o\'tish uchun ekrandagi maxsus tugmani bosing.';

  @override
  String get subjectSection => 'Fan bo\'limi';

  @override
  String get arActive => 'AR FAOL';

  @override
  String get arStart => 'AR BOSHLASH';

  @override
  String get astronomyDesc =>
      'Koinotni xonangizda kashf eting! AR orqali Quyosh sistemasi va yulduzlarni hayotiy o\'lchamda kuzating. Vaqt va makonni aql bilan o\'rganing.';

  @override
  String get biologyDesc =>
      'Biologiya — tirik organizmlardagi hayot sirlarini AR texnologiyasi orqali 3D ko\'rinishda o\'rganasiz. Hujayra ichidagi murakkab jarayonlarni kuzating.';

  @override
  String get chemistryDesc =>
      'Kimyoviy moddalar, atomlar va molekulalarni AR yordamida 3D shaklda ko\'ring. Davriy jadval elementlarini interaktiv tarzda o\'rganing.';

  @override
  String get physicsDesc =>
      'Fizika qonunlarini AR orqali real ko\'ring. Gravitatsiya, elektr, magnit va yorug\'lik kabi kuchlarni 3D simulatsiyalar orqali tushunasiz.';

  @override
  String get astronomyStat1 => '9';

  @override
  String get astronomyStat1Label => 'Sayyora';

  @override
  String get astronomyStat2 => '36';

  @override
  String get astronomyStat2Label => 'AR Model';

  @override
  String get astronomyStat3 => '360°';

  @override
  String get astronomyStat3Label => 'Ko\'rinish';

  @override
  String get biologyStat1 => '12';

  @override
  String get biologyStat1Label => 'Mavzu';

  @override
  String get biologyStat2 => '48';

  @override
  String get biologyStat2Label => 'AR Model';

  @override
  String get biologyStat3 => '3D';

  @override
  String get biologyStat3Label => 'Ko\'rinish';

  @override
  String get chemistryStat1 => '118';

  @override
  String get chemistryStat1Label => 'Element';

  @override
  String get chemistryStat2 => '54';

  @override
  String get chemistryStat2Label => 'AR Model';

  @override
  String get chemistryStat3 => '3D';

  @override
  String get chemistryStat3Label => 'Molekula';

  @override
  String get physicsStat1 => '15';

  @override
  String get physicsStat1Label => 'Mavzu';

  @override
  String get physicsStat2 => '62';

  @override
  String get physicsStat2Label => 'AR Model';

  @override
  String get physicsStat3 => 'Real';

  @override
  String get physicsStat3Label => 'Simulatsiya';

  @override
  String get topicSun => 'Quyosh';

  @override
  String get topicPlanets => 'Sayyoralar';

  @override
  String get topicMoon => 'Oy fazalari';

  @override
  String get topicStars => 'Yulduzlar';

  @override
  String get topicCell => 'Hujayra';

  @override
  String get topicDna => 'DNK';

  @override
  String get topicPlants => 'O\'simliklar';

  @override
  String get topicAnimals => 'Hayvonlar';

  @override
  String get topicAtom => 'Atom';

  @override
  String get topicBond => 'Bog\'lanish';

  @override
  String get topicReaction => 'Reaksiya';

  @override
  String get topicTable => 'D. jadval';

  @override
  String get topicWaves => 'To\'lqinlar';

  @override
  String get topicMagnet => 'Magnit';

  @override
  String get topicOptics => 'Optika';

  @override
  String get topicMechanics => 'Mexanika';

  @override
  String get flowerAnatomy => 'Gul anatomiyasi';

  @override
  String get petal => 'Gultojibarg';

  @override
  String get petalDesc =>
      'Gulning rangli, barcha hasharotlarni jalb qiladigan qismi.';

  @override
  String get stigma => 'Tumshukcha';

  @override
  String get stigmaDesc => 'Urug\'chining yuqori qismi, changni qabul qiladi.';

  @override
  String get style => 'Ustuncha';

  @override
  String get styleDesc =>
      'Urug\'chining o\'rta qismi, tumshukchani tuguncha bilan bog\'laydi.';

  @override
  String get ovary => 'Tuguncha';

  @override
  String get ovaryDesc =>
      'Urug\'chining pastki kengaygan qismi, u yerda urug\'murtaklar joylashadi.';

  @override
  String get ovule => 'Urug\'murtak';

  @override
  String get ovuleDesc =>
      'Tuguncha ichidagi qism, u yerda urug\'lanish amalga oshadi.';

  @override
  String get sepal => 'Kosachabarg';

  @override
  String get sepalDesc => 'Gulning eng quyi, himoya qiluvchi yashil barglari.';

  @override
  String get anther => 'Changdon';

  @override
  String get antherDesc =>
      'Changchining yuqori qismi, unda chang donachalari yetiladi.';

  @override
  String get stamen => 'Changchi';

  @override
  String get stamenDesc => 'Gulning erkaklik ko\'payish organi.';

  @override
  String get filament => 'Changchi ipi';

  @override
  String get filamentDesc => 'Changdonni tutib turuvchi ingichka ip.';

  @override
  String get receptacle => 'Gulo\'rni';

  @override
  String get receptacleDesc => 'Gulning barcha qismlari birikadigan asosi.';

  @override
  String get pedicel => 'Gulband';

  @override
  String get pedicelDesc => 'Gulni poyaga birlashtiruvchi qismi.';

  @override
  String get cellAnatomy => 'Hujayra anatomiyasi';

  @override
  String get nucleus => 'Yadro';

  @override
  String get nucleusDesc =>
      'Hujayraning boshqaruv markazi, unda irsiy ma\'lumot saqlanadi.';

  @override
  String get mitochondria => 'Mitoxondriya';

  @override
  String get mitochondriaDesc =>
      'Hujayraning energetik stansiyasi, ATF energiya ishlab chiqaradi.';

  @override
  String get golgi => 'Goldji apparati';

  @override
  String get golgiDesc => 'Oqsillarni saralaydi va kerakli joyga jo\'natadi.';

  @override
  String get reticulum => 'Endoplazmatik to\'r';

  @override
  String get reticulumDesc =>
      'Moddalarni tashish va sintez qilish kanallari tizimi.';

  @override
  String get ribosome => 'Ribosoma';

  @override
  String get ribosomeDesc => 'Oqsil sintez qiluvchi kichik organoidlar.';

  @override
  String get vacuole => 'Vakuola';

  @override
  String get vacuoleDesc => 'Suv va ozuqa moddalarini saqlaydigan bo\'shliq.';

  @override
  String get lysosome => 'Lizosoma';

  @override
  String get lysosomeDesc =>
      'Hujayra ichidagi moddalarni parchalovchi organoid.';

  @override
  String get membrane => 'Membrana';

  @override
  String get membraneDesc =>
      'Hujayrani tashqi muhitdan ajratib turuvchi himoya qobig\'i.';

  @override
  String get correct => 'To\'g\'ri!';

  @override
  String get wrong => 'Xato!';

  @override
  String get next => 'Keyingisi';

  @override
  String get finish => 'Tugatish';

  @override
  String get quizTitle => 'Hujayra qismlarini toping';

  @override
  String get animalCell => 'Hayvon hujayrasi';

  @override
  String get plantCell => 'O\'simlik hujayrasi';

  @override
  String score(int correct, int total) {
    return 'Natija: $correct / $total';
  }

  @override
  String get motivationHigh => 'Ajoyib! Siz haqiqiy biologsiz! 🧬';

  @override
  String get motivationMed => 'Yaxshi natija! Yana bir bor urinib ko\'ring! 💪';

  @override
  String get motivationLow =>
      'Hali o\'rganadigan narsalar ko\'p. Bo\'shashmang! 📚';

  @override
  String get tryAgain => 'Qayta urinish';

  @override
  String get finishSession => 'Tugalsh';
}
