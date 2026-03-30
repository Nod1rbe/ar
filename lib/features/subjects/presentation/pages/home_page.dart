import 'package:ar/core/cubit/settings_cubit.dart';
import 'package:ar/core/cubit/settings_state.dart';
import 'package:ar/features/subjects/presentation/cubit/subject_cubit.dart';
import 'package:ar/features/subjects/presentation/cubit/subject_state.dart';
import 'package:ar/features/subjects/presentation/pages/ar_view_page.dart';
import 'package:ar/features/subjects/presentation/pages/astronomy_menu_page.dart';
import 'package:ar/features/subjects/presentation/pages/biology_menu_page.dart';
import 'package:ar/features/subjects/presentation/pages/chemistry_menu_page.dart';
import 'package:ar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<SubjectCubit>().loadSubjects();
  }

  void _showSettingsDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            final l10n = AppLocalizations.of(context)!;
            final isDark = state.themeMode == ThemeMode.dark;
            final theme = Theme.of(context);
            return Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 40,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle indicator
                  Container(
                    width: 48,
                    height: 6,
                    decoration: BoxDecoration(
                      color: theme.dividerColor.withAlpha(50),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        color: theme.colorScheme.primary,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        l10n.settings,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: theme.textTheme.titleLarge?.color,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  
                  // Theme Setting Tile
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: theme.dividerColor.withAlpha(30),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(10),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isDark ? Colors.indigoAccent.withAlpha(40) : Colors.orangeAccent.withAlpha(40),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                                color: isDark ? Colors.indigoAccent : Colors.orangeAccent,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'Dark Mode', // Fallback text when no localization
                              style: TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.w600,
                                color: theme.textTheme.bodyLarge?.color,
                              ),
                            ),
                          ],
                        ),
                        Switch.adaptive(
                          value: isDark,
                          activeColor: Colors.indigoAccent,
                          activeTrackColor: Colors.indigoAccent.withAlpha(80),
                          inactiveThumbColor: Colors.orangeAccent,
                          inactiveTrackColor: Colors.orangeAccent.withAlpha(40),
                          trackOutlineColor: WidgetStateProperty.resolveWith((states) => Colors.transparent),
                          onChanged: (val) {
                            context.read<SettingsCubit>().updateTheme(
                              val ? ThemeMode.dark : ThemeMode.light,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Language Setting Tile
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: theme.dividerColor.withAlpha(30),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(10),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.green.withAlpha(40),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.language_rounded,
                                color: Colors.green,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              l10n.language,
                              style: TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.w600,
                                color: theme.textTheme.bodyLarge?.color,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withAlpha(20),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: state.localeCode,
                              icon: Icon(Icons.keyboard_arrow_down_rounded, color: theme.colorScheme.primary),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                              ),
                              dropdownColor: theme.cardColor,
                              borderRadius: BorderRadius.circular(16),
                              items: const [
                                DropdownMenuItem(value: 'uz', child: Text("O'zbek")),
                                DropdownMenuItem(value: 'en', child: Text("English")),
                                DropdownMenuItem(value: 'ru', child: Text("Русский")),
                              ],
                              onChanged: (val) {
                                if (val != null) {
                                  context.read<SettingsCubit>().updateLocale(val);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Action Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  String _getLocalizedSubjectName(BuildContext context, String rawName) {
    final l10n = AppLocalizations.of(context)!;
    switch (rawName.toLowerCase()) {
      case 'biologiya':
        return l10n.biology;
      case 'astronomiya':
        return l10n.astronomy;
      case 'kimyo':
        return l10n.chemistry;
      case 'fizika':
        return l10n.physics;
      default:
        return rawName;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _showSettingsDialog,
          ),
        ],
      ),
      body: BlocBuilder<SubjectCubit, SubjectState>(
        builder: (context, state) {
          if (state is SubjectLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SubjectError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is SubjectLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.subjects.length,
              itemBuilder: (context, index) {
                final subject = state.subjects[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent.withAlpha(51),
                      radius: 30,
                      child: const Icon(
                        Icons.school,
                        size: 30,
                        color: Colors.blueAccent,
                      ),
                    ),
                    title: Text(
                      _getLocalizedSubjectName(context, subject.name),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(subject.description),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      final title = subject.name.toLowerCase();
                      if (title == 'biologiya') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BiologyMenuPage(subject: subject),
                          ),
                        );
                      } else if (title == 'kimyo') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChemistryMenuPage(subject: subject),
                          ),
                        );
                      } else if (title == 'astronomiya') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AstronomyMenuPage(subject: subject),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ARViewPage(subject: subject),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            );
          }
          return Center(child: Text(l10n.dataNotFound));
        },
      ),
    );
  }
}
