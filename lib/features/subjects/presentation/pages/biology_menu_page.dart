import 'package:ar/features/subjects/domain/entities/subject.dart';
import 'package:ar/features/subjects/presentation/pages/bee_pollination_page.dart';
import 'package:ar/features/subjects/presentation/pages/flower_growth_page.dart';
import 'package:ar/features/subjects/presentation/pages/heart_pulse_page.dart';
import 'package:ar/features/subjects/presentation/pages/xray_anatomy_page.dart';
import 'package:flutter/material.dart';

class BiologyMenuPage extends StatelessWidget {
  final SubjectEntity subject;

  const BiologyMenuPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${subject.name} - Amaliyotlar'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuCard(
            context,
            title: "Gul O'sishi",
            subtitle: "Gulning urug'dan unib chiqishi AR modelida",
            icon: Icons.local_florist,
            color: Colors.green,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FlowerGrowthPage()),
            ),
          ),
          _buildMenuCard(
            context,
            title: "Changlantirish",
            subtitle: "Asalarining gullardan chang yig'ishi",
            icon: Icons.bug_report,
            color: Colors.amber,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BeePollinationPage()),
            ),
          ),
          _buildMenuCard(
            context,
            title: "Yurak Urishi",
            subtitle: "Inson yuragi urish tezligini nazorat qilish",
            icon: Icons.favorite,
            color: Colors.redAccent,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HeartPulsePage()),
            ),
          ),
          _buildMenuCard(
            context,
            title: "X-Ray Anatomiyasi",
            subtitle: "Tirik mavjudotning ichki organlari (Shaffof)",
            icon: Icons.visibility,
            color: Colors.blueGrey,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const XrayAnatomyPage()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: CircleAvatar(
          backgroundColor: color.withAlpha(51),
          radius: 30,
          child: Icon(icon, size: 30, color: color),
        ),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(subtitle, style: const TextStyle(fontSize: 14)),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 20),
        onTap: onTap,
      ),
    );
  }
}
