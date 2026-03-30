import 'package:ar/features/subjects/domain/entities/subject.dart';
import 'package:ar/features/subjects/presentation/pages/lunar_eclipse_page.dart';
import 'package:ar/features/subjects/presentation/pages/solar_system_page.dart';
import 'package:flutter/material.dart';

class AstronomyMenuPage extends StatelessWidget {
  final SubjectEntity subject;

  const AstronomyMenuPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${subject.name} - Koinot'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuCard(
            context,
            title: "Quyosh Sistemasi",
            subtitle: "Sayyoralarning umumiy aylanish tezligini boshqaring",
            icon: Icons.public,
            color: Colors.blueAccent,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SolarSystemPage()),
            ),
          ),
          _buildMenuCard(
            context,
            title: "Oy Tutilishi",
            subtitle: "Yer, Oy va Quyosh nuring kesishishi simulyatsiyasi",
            icon: Icons.nights_stay,
            color: Colors.indigo,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LunarEclipsePage()),
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
