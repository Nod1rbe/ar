import 'package:ar/core/cubit/settings_cubit.dart';
import 'package:ar/core/cubit/settings_state.dart';
import 'package:ar/features/subjects/presentation/cubit/subject_cubit.dart';
import 'package:ar/features/subjects/presentation/pages/home_page.dart';
import 'package:ar/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SubjectCubit>(create: (_) => di.sl<SubjectCubit>()),
        BlocProvider<SettingsCubit>(create: (_) => di.sl<SettingsCubit>()),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, settingsState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Maktab AR',
            themeMode: settingsState.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: const Color(0xFF00C853),
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF00C853),
                primary: const Color(0xFF00C853),
                secondary: const Color(0xFF7C3AED),
                surface: Colors.white,
                onSurface: const Color(0xFF0F172A),
              ),
              scaffoldBackgroundColor: const Color(0xFFF8FAFC),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: false,
                iconTheme: IconThemeData(color: Color(0xFF0F172A)),
              ),
              cardTheme: const CardThemeData(
                elevation: 0,
                margin: EdgeInsets.zero,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: const Color(0xFF00F59B),
              colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.dark,
                seedColor: const Color(0xFF00F59B),
                primary: const Color(0xFF00F59B),
                secondary: const Color(0xFF8B5CF6),
                surface: const Color(0xFF0F172A),
                onSurface: Colors.white,
              ),
              scaffoldBackgroundColor: const Color(0xFF020617),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: false,
                iconTheme: IconThemeData(color: Colors.white),
              ),
              cardTheme: const CardThemeData(
                elevation: 0,
                margin: EdgeInsets.zero,
              ),
              useMaterial3: true,
            ),
            locale: Locale(settingsState.localeCode),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('uz'), Locale('en'), Locale('ru')],
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
