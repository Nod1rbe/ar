// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Школа AR';

  @override
  String get homeTitle => 'AR Приложение Школы';

  @override
  String get dataNotFound => 'Данные не найдены';

  @override
  String get loading => 'Загрузка...';

  @override
  String get biology => 'Биология';

  @override
  String get astronomy => 'Астрономия';

  @override
  String get physics => 'Физика';

  @override
  String get chemistry => 'Химия';

  @override
  String get practice => 'Практика';

  @override
  String get flowerGrowthTitle => 'Рост Цветка';

  @override
  String get flowerGrowthSub => 'Интерактивный рост цветка из семени в AR';

  @override
  String get beePollinationTitle => 'Опыление';

  @override
  String get beePollinationSub => 'Пчела собирает пыльцу с цветов';

  @override
  String get heartPulseTitle => 'Пульс Сердца';

  @override
  String get heartPulseSub => 'Контроль частоты сердцебиения человека';

  @override
  String get xrayAnatomyTitle => 'Рентген Анатомия';

  @override
  String get xrayAnatomySub => 'Прозрачные внутренние органы живых существ';

  @override
  String get atomStructureTitle => 'Структура Атома';

  @override
  String get atomStructureSub =>
      'Наблюдайте движение электронов вокруг 3D атома';

  @override
  String get chemReactionTitle => 'Химическая Реакция';

  @override
  String get chemReactionSub => 'Процесс смешивания двух химических элементов';

  @override
  String get solarSystemTitle => 'Солнечная Система';

  @override
  String get solarSystemSub => 'Управление общей орбитальной скоростью планет';

  @override
  String get lunarEclipseTitle => 'Лунное Затмение';

  @override
  String get lunarEclipseSub => 'Симуляция выравнивания Земли, Луны и Солнца';

  @override
  String get waterDrop => 'Полить';

  @override
  String get flowerGrowing => 'Цветок растет... (Изменение масштаба)';

  @override
  String get pollinateBtn => 'Опылять';

  @override
  String speedPulse(int rate) {
    return 'Пульс: $rate уд/мин';
  }

  @override
  String get xrayMode => 'Рентген (Прозрачный) Режим';

  @override
  String electronSpeed(int speed) {
    return 'Скорость электрона: $speed';
  }

  @override
  String get mixChemicals => 'Смешать (Реакция)';

  @override
  String get reactionHappening => 'Реакция идет! Пламя или изменение цвета.';

  @override
  String orbitSpeed(int speed) {
    return 'Орбитальная скорость: $speed км/с';
  }

  @override
  String get startEclipse => 'Начать Затмение';

  @override
  String get eclipseHappening => 'Луна проходит между Солнцем и Землей...';

  @override
  String modelLoading(String name) {
    return 'Вызов модели в центр: \nЗагрузка ($name) из интернета...';
  }

  @override
  String get modelAdded => 'Модель успешно загружена!';

  @override
  String get modelError => 'Не удалось добавить модель!';

  @override
  String get settings => 'Настройки';

  @override
  String get language => 'Язык';
}
