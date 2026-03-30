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
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.settings),
          content: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Dark Mode'),
                      Switch(
                        value: state.themeMode == ThemeMode.dark,
                        onChanged: (val) {
                          context.read<SettingsCubit>().updateTheme(
                            val ? ThemeMode.dark : ThemeMode.light,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.language),
                      DropdownButton<String>(
                        value: state.localeCode,
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
                    ],
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
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
