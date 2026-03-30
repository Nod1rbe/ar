import 'package:ar/features/subjects/domain/entities/subject.dart';
import 'package:ar/features/subjects/presentation/pages/atom_structure_page.dart';
import 'package:ar/features/subjects/presentation/pages/chemical_reaction_page.dart';
import 'package:flutter/material.dart';

class ChemistryMenuPage extends StatelessWidget {
  final SubjectEntity subject;

  const ChemistryMenuPage({super.key, required this.subject});

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
            title: "Atom Konstruktori",
            subtitle: "3D model atrofida elektronlar harakatini kuzating",
            icon: Icons.science,
            color: Colors.teal,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AtomStructurePage()),
            ),
          ),
          _buildMenuCard(
            context,
            title: "Kimyoviy Reaksiya",
            subtitle: "Ikki xil modda elementlarini aralashtirish jarayoni",
            icon: Icons.bubble_chart,
            color: Colors.purple,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChemicalReactionPage()),
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
