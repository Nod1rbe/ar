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

  @override
  String get arTechnology => 'AR ТЕХНОЛОГИЯ';

  @override
  String get schoolAppPart1 => 'ШКОЛЬНОЕ';

  @override
  String get schoolAppPart2 => 'ПРИЛОЖЕНИЕ';

  @override
  String get learnWithAr => 'Обучение с дополненной реальностью';

  @override
  String get arReady => 'AR ГОТОВО';

  @override
  String get arGuide =>
      'Вы можете вращать и масштабировать 3D-модель. Нажмите специальную кнопку на экране, чтобы войти в режим «AR».';

  @override
  String get subjectSection => 'Раздел предмета';

  @override
  String get arActive => 'AR АКТИВЕН';

  @override
  String get arStart => 'НАЧАТЬ AR';

  @override
  String get astronomyDesc =>
      'Откройте вселенную в своей комнате! Наблюдайте за солнечной системой и звездами в натуральную величину через AR. Исследуйте время и пространство.';

  @override
  String get biologyDesc =>
      'Биология — узнайте секреты жизни живых организмов с помощью технологии AR в 3D. Наблюдайте за процессами внутри клетки.';

  @override
  String get chemistryDesc =>
      'Просматривайте химикаты, атомы и молекулы в 3D с помощью AR. Изучайте элементы периодической таблицы в интерактивном режиме.';

  @override
  String get physicsDesc =>
      'Увидьте законы физики в реальной жизни через AR. Разбирайтесь в силах, таких как гравитация, электричество, магнетизм и свет, через 3D-симуляции.';

  @override
  String get astronomyStat1 => '9';

  @override
  String get astronomyStat1Label => 'Планет';

  @override
  String get astronomyStat2 => '36';

  @override
  String get astronomyStat2Label => 'Моделей AR';

  @override
  String get astronomyStat3 => '360°';

  @override
  String get astronomyStat3Label => 'Обзор';

  @override
  String get biologyStat1 => '12';

  @override
  String get biologyStat1Label => 'Уроков';

  @override
  String get biologyStat2 => '48';

  @override
  String get biologyStat2Label => 'Моделей AR';

  @override
  String get biologyStat3 => '3D';

  @override
  String get biologyStat3Label => 'Обзор';

  @override
  String get chemistryStat1 => '118';

  @override
  String get chemistryStat1Label => 'Элементов';

  @override
  String get chemistryStat2 => '54';

  @override
  String get chemistryStat2Label => 'Моделей AR';

  @override
  String get chemistryStat3 => '3D';

  @override
  String get chemistryStat3Label => 'Молекул';

  @override
  String get physicsStat1 => '15';

  @override
  String get physicsStat1Label => 'Уроков';

  @override
  String get physicsStat2 => '62';

  @override
  String get physicsStat2Label => 'Моделей AR';

  @override
  String get physicsStat3 => 'Реал';

  @override
  String get physicsStat3Label => 'Симуляция';

  @override
  String get topicSun => 'Солнце';

  @override
  String get topicPlanets => 'Планеты';

  @override
  String get topicMoon => 'Фазы Луны';

  @override
  String get topicStars => 'Звезды';

  @override
  String get topicCell => 'Клетка';

  @override
  String get topicDna => 'ДНК';

  @override
  String get topicPlants => 'Растения';

  @override
  String get topicAnimals => 'Животные';

  @override
  String get topicAtom => 'Атом';

  @override
  String get topicBond => 'Связи';

  @override
  String get topicReaction => 'Реакция';

  @override
  String get topicTable => 'Т. Менд.';

  @override
  String get topicWaves => 'Волны';

  @override
  String get topicMagnet => 'Магнит';

  @override
  String get topicOptics => 'Оптика';

  @override
  String get topicMechanics => 'Механика';

  @override
  String get flowerAnatomy => 'Анатомия цветка';

  @override
  String get petal => 'Лепесток';

  @override
  String get petalDesc => 'Красочная часть цветка, привлекающая насекомых.';

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
  String get sepal => 'Чашелистик';

  @override
  String get sepalDesc => 'Внешние зеленые листья цветка, защищающие бутон.';

  @override
  String get anther => 'Changdon';

  @override
  String get antherDesc =>
      'Changchining yuqori qismi, unda chang donachalari yetiladi.';

  @override
  String get stamen => 'Тычинка';

  @override
  String get stamenDesc =>
      'Мужской репродуктивный орган цветка, производящий пыльцу.';

  @override
  String get filament => 'Changchi ipi';

  @override
  String get filamentDesc => 'Changdonni tutib turuvchi ingichka ip.';

  @override
  String get receptacle => 'Цветоложе';

  @override
  String get receptacleDesc =>
      'Утолщенное основание, к которому прикрепляются все части цветка.';

  @override
  String get pedicel => 'Цветоножка';

  @override
  String get pedicelDesc => 'Часть, соединяющая цветок со стеблем.';

  @override
  String get cellAnatomy => 'Анатомия клетки';

  @override
  String get nucleus => 'Ядро';

  @override
  String get nucleusDesc =>
      'Центр управления клеткой, содержит наследственную информацию.';

  @override
  String get mitochondria => 'Митохондрия';

  @override
  String get mitochondriaDesc =>
      'Энергетическая станция клетки, синтезирует АТФ.';

  @override
  String get golgi => 'Аппарат Гольджи';

  @override
  String get golgiDesc => 'Сортирует и упаковывает белки для передачи.';

  @override
  String get reticulum => 'Эндоплазматическая сеть';

  @override
  String get reticulumDesc =>
      'Система каналов для транспорта и синтеза веществ.';

  @override
  String get ribosome => 'Рибосома';

  @override
  String get ribosomeDesc => 'Органоиды, на которых происходит синтез белка.';

  @override
  String get vacuole => 'Вакуоль';

  @override
  String get vacuoleDesc =>
      'Полость, заполненная клеточным соком с питательными веществами.';

  @override
  String get lysosome => 'Лизосома';

  @override
  String get lysosomeDesc =>
      'Органоид, расщепляющий питательные вещества в клетке.';

  @override
  String get membrane => 'Клеточная мембрана';

  @override
  String get membraneDesc =>
      'Защитный слой, отделяющий клетку от внешней среды.';

  @override
  String get correct => 'Правильно!';

  @override
  String get wrong => 'Ошибка!';

  @override
  String get next => 'Следующий';

  @override
  String get finish => 'Завершить';

  @override
  String get quizTitle => 'Определите части клетки';

  @override
  String get animalCell => 'Животная клетка';

  @override
  String get plantCell => 'Растительная клетка';

  @override
  String score(int correct, int total) {
    return 'Результат: $correct / $total';
  }

  @override
  String get motivationHigh => 'Отлично! Вы настоящий биолог! 🧬';

  @override
  String get motivationMed => 'Хороший результат! Попробуйте еще раз! 💪';

  @override
  String get motivationLow => 'Многое еще предстоит узнать. Не сдавайтесь! 📚';

  @override
  String get tryAgain => 'Попробовать снова';

  @override
  String get finishSession => 'Завершить';
}
