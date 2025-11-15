import 'package:flutter/material.dart';

class DiseaseDetailPage extends StatelessWidget {
  final Map<String, dynamic> disease;

  const DiseaseDetailPage({
    Key? key,
    required this.disease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String diseaseName = disease['name'];
    final String latinName = disease['latin'];
    final String severity = disease['severity'];
    final String imagePath = disease['imagePath'];
    final String description = disease['description'];
    final List<String> symptoms = List<String>.from(disease['symptoms']);
    final List<String> causes = List<String>.from(disease['causes']);
    final List<String> treatments = List<String>.from(disease['treatments']);

    Color severityColor = severity == 'TINGGI'
        ? Colors.red
        : severity == 'SEDANG'
            ? Colors.orange
            : Colors.yellow;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Detail Penyakit'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          diseaseName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: severityColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          severity,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    latinName,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            _buildInfoSection(
              context: context,
              icon: Icons.info_outline,
              title: 'Gejala',
              iconColor: Colors.blue,
              items: symptoms,
            ),
            const SizedBox(height: 16),
            _buildInfoSection(
              context: context,
              icon: Icons.warning_amber,
              title: 'Penyebab',
              iconColor: Colors.orange,
              items: causes,
            ),
            const SizedBox(height: 16),
            _buildInfoSection(
              context: context,
              icon: Icons.medication,
              title: 'Pengobatan',
              iconColor: Colors.green,
              items: treatments,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Color iconColor,
    required List<String> items,
  }) {
    Color sectionColor = iconColor.withOpacity(0.1);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: sectionColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(icon, color: iconColor),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.map((item) => _buildListItem(item)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 14)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}