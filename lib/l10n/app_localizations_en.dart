// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'School AR';

  @override
  String get homeTitle => 'AR School App';

  @override
  String get dataNotFound => 'No data found';

  @override
  String get loading => 'Loading...';

  @override
  String get biology => 'Biology';

  @override
  String get astronomy => 'Astronomy';

  @override
  String get physics => 'Physics';

  @override
  String get chemistry => 'Chemistry';

  @override
  String get practice => 'Practices';

  @override
  String get flowerGrowthTitle => 'Flower Growth';

  @override
  String get flowerGrowthSub => 'Interactive flower growing from a seed in AR';

  @override
  String get beePollinationTitle => 'Pollination';

  @override
  String get beePollinationSub => 'A bee gathering pollen from flowers';

  @override
  String get heartPulseTitle => 'Heart Pulse';

  @override
  String get heartPulseSub => 'Control the human heart beating rate';

  @override
  String get xrayAnatomyTitle => 'X-Ray Anatomy';

  @override
  String get xrayAnatomySub =>
      'Transparent internal organs of living creatures';

  @override
  String get atomStructureTitle => 'Atom Structure';

  @override
  String get atomStructureSub => 'Observe electron movements around a 3D atom';

  @override
  String get chemReactionTitle => 'Chemical Reaction';

  @override
  String get chemReactionSub =>
      'Mixing process of two different chemical elements';

  @override
  String get solarSystemTitle => 'Solar System';

  @override
  String get solarSystemSub => 'Control the overall orbital speed of planets';

  @override
  String get lunarEclipseTitle => 'Lunar Eclipse';

  @override
  String get lunarEclipseSub => 'Simulation of Earth, Moon, and Sun alignment';

  @override
  String get waterDrop => 'Add water';

  @override
  String get flowerGrowing => 'Flower is growing... (Scale change)';

  @override
  String get pollinateBtn => 'Pollinate';

  @override
  String speedPulse(int rate) {
    return 'Rate: $rate bpm';
  }

  @override
  String get xrayMode => 'X-Ray (Transparent) Mode';

  @override
  String electronSpeed(int speed) {
    return 'Electron speed: $speed';
  }

  @override
  String get mixChemicals => 'Mix (React)';

  @override
  String get reactionHappening => 'Reaction occurring! Flame or color change.';

  @override
  String orbitSpeed(int speed) {
    return 'Orbital speed: $speed km/s';
  }

  @override
  String get startEclipse => 'Start Eclipse';

  @override
  String get eclipseHappening => 'Moon is passing between Sun and Earth...';

  @override
  String modelLoading(String name) {
    return 'Summoning model to center: \nDownloading ($name) from internet...';
  }

  @override
  String get modelAdded => 'Model loaded successfully!';

  @override
  String get modelError => 'Failed to add model!';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';
}
