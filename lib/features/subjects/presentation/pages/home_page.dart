import 'package:ar/core/widgets/global_settings_header.dart';
import 'package:ar/features/subjects/presentation/cubit/subject_cubit.dart';
import 'package:ar/features/subjects/presentation/cubit/subject_state.dart';
import 'package:ar/features/subjects/presentation/pages/subject_detail_page.dart';
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

  String _getLocalizedSubjectName(BuildContext context, String rawName) {
    final l10n = AppLocalizations.of(context)!;
    switch (rawName.toLowerCase()) {
      case 'biologiya': return l10n.biology;
      case 'astronomiya': return l10n.astronomy;
      case 'kimyo': return l10n.chemistry;
      case 'fizika': return l10n.physics;
      default: return rawName;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          if (isDark) const Positioned.fill(child: _GridBackground()),
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF00F59B),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  l10n.arTechnology,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2,
                                    color: const Color(0xFF00F59B).withAlpha(200),
                                  ),
                                ),
                              ],
                            ),
                            const GlobalSettingsHeader(),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.schoolAppPart1.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1,
                            height: 1.1,
                          ),
                        ),
                        Text(
                          l10n.schoolAppPart2.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1,
                            color: Color(0xFF00F59B),
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.learnWithAr,
                          style: TextStyle(
                            fontSize: 16,
                            color: (isDark ? Colors.white : Colors.black87).withAlpha(150),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: BlocBuilder<SubjectCubit, SubjectState>(
                    builder: (context, state) {
                      if (state is SubjectLoading) {
                        return const SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
                      } else if (state is SubjectError) {
                        return SliverFillRemaining(child: Center(child: Text(state.message)));
                      } else if (state is SubjectLoaded) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final subject = state.subjects[index];
                              return _SubjectCard(
                                subject: subject,
                                name: _getLocalizedSubjectName(context, subject.name),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SubjectDetailPage(subject: subject),
                                    ),
                                  );
                                },
                              );
                            },
                            childCount: state.subjects.length,
                          ),
                        );
                      }
                      return const SliverFillRemaining(child: SizedBox());
                    },
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 40)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GridBackground extends StatelessWidget {
  const _GridBackground();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GridPainter(),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withAlpha(10)
      ..strokeWidth = 0.5;

    const spacing = 30.0;

    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _SubjectCard extends StatefulWidget {
  final dynamic subject;
  final String name;
  final VoidCallback onTap;

  const _SubjectCard({required this.subject, required this.name, required this.onTap});

  @override
  State<_SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<_SubjectCard> {
  bool _isPressed = false;

  Color _getSubjectColor() {
    final name = widget.name.toLowerCase();
    // Using Uz labels or internal name check from data source
    if (name.contains('biologiya') || name.contains('biology')) return const Color(0xFF00F59B);
    if (name.contains('astronomiya') || name.contains('astronomy')) return const Color(0xFF8B5CF6);
    if (name.contains('kimyo') || name.contains('chemistry')) return const Color(0xFFF59E0B);
    if (name.contains('fizika') || name.contains('physics')) return const Color(0xFFEF4444);
    return const Color(0xFF3B82F6);
  }

  IconData _getSubjectIcon() {
    final name = widget.name.toLowerCase();
    if (name.contains('biologiya') || name.contains('biology')) return Icons.biotech_rounded;
    if (name.contains('astronomiya') || name.contains('astronomy')) return Icons.rocket_launch_rounded;
    if (name.contains('kimyo') || name.contains('chemistry')) return Icons.science_rounded;
    if (name.contains('fizika') || name.contains('physics')) return Icons.bolt_rounded;
    return Icons.category_rounded;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final subjectColor = _getSubjectColor();
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: isDark ? const Color(0xFF0F172A).withAlpha(200) : Colors.white,
            border: Border.all(
              color: (isDark ? Colors.white : Colors.black).withAlpha(15),
              width: 1,
            ),
            boxShadow: [
              if (!isDark)
                BoxShadow(
                  color: Colors.black.withAlpha(5),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: subjectColor.withAlpha(30),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  _getSubjectIcon(),
                  color: subjectColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subject.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: (isDark ? Colors.white : Colors.black87).withAlpha(120),
                        height: 1.3,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: subjectColor.withAlpha(20),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: subjectColor.withAlpha(40)),
                      ),
                      child: Text(
                        l10n.arReady,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          color: subjectColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 20,
                color: (isDark ? Colors.white : Colors.black).withAlpha(60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
