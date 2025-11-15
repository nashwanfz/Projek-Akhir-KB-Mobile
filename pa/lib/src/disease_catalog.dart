import 'package:flutter/material.dart';
import 'disease_detail.dart';
import 'disease_data.dart';

class DiseaseCatalogPage extends StatefulWidget {
  const DiseaseCatalogPage({Key? key}) : super(key: key);

  @override
  State<DiseaseCatalogPage> createState() => _DiseaseCatalogPageState();
}

class _DiseaseCatalogPageState extends State<DiseaseCatalogPage> {
  final _searchController = TextEditingController();

  // Menggunakan data dari DiseaseData helper class
  List<Map<String, dynamic>> get diseases => DiseaseData.diseases;

  final List<Map<String, dynamic>> _oldDiseases = [
    {
      'name': 'Karat Mawar',
      'latin': 'Phragmidium mucronatum',
      'severity': 'SEDANG',
      'imagePath': 'assets/images/rose-rust.jpg',
      'description': 'Karat mawar adalah penyakit jamur yang menyebabkan munculnya bintik-bintik berwarna oranye kemerahan (seperti karat) terutama di bagian bawah daun. Infeksi berat dapat menyebabkan daun gugur dan melemahkan tanaman secara signifikan.',
      'symptoms': [
        'Bintik-bintik oranye-kuning di permukaan atas daun',
        'Pustula oranye-merah di permukaan bawah daun',
        'Daun menguning dan rontok di musim panas',
        'Pada infeksi berat, batang juga bisa terinfeksi',
        'Pertumbuhan tanaman terhambat'
      ],
      'causes': [
        'Infeksi jamur Phragmidium mucronatum',
        'Kondisi lembab dan basah dalam waktu lama',
        'Sirkulasi udara yang buruk',
        'Daun yang tetap basah setelah disiram',
        'Cuaca hangat dengan kelembaban tinggi'
      ],
      'treatments': [
        'Buang dan hancurkan daun yang terinfeksi',
        'Aplikasikan fungisida preventif sebelum musim hujan',
        'Pastikan tanaman memiliki drainase yang baik',
        'Kurangi kelembaban di sekitar tanaman',
        'Pangkas untuk meningkatkan sirkulasi udara'
      ]
    },
    {
      'name': 'Sehat',
      'latin': 'Rosa sp. (Healthy)',
      'severity': 'RENDAH',
      'imagePath': 'assets/images/rose-healthy.jpg',
      'description': 'Daun mawar yang sehat menunjukkan warna hijau cerah yang merata, tekstur halus, dan tidak ada tanda-tanda bercak, perubahan warna, atau kerusakan. Tanaman sehat adalah hasil dari perawatan yang baik, nutrisi yang cukup, dan lingkungan yang optimal.',
      'symptoms': [
        'Daun berwarna hijau cerah dan merata',
        'Tekstur daun halus dan berkilau',
        'Tidak ada bercak atau perubahan warna',
        'Pertumbuhan normal dan vigor baik',
        'Fotosintesis optimal'
      ],
      'causes': [
        'Perawatan tanaman yang baik dan konsisten',
        'Nutrisi yang seimbang dan cukup',
        'Penyiraman yang tepat',
        'Pencahayaan matahari yang optimal',
        'Sirkulasi udara yang baik'
      ],
      'treatments': [
        'Lanjutkan perawatan rutin yang sudah dilakukan',
        'Berikan pemupukan secara teratur',
        'Pantau kondisi tanaman secara berkala',
        'Jaga kebersihan area sekitar tanaman',
        'Lakukan pemangkasan untuk menjaga bentuk'
      ]
    },
    {
      'name': 'Gigitan Serangga',
      'latin': 'Insect Damage',
      'severity': 'SEDANG',
      'imagePath': 'assets/images/rose-insect.jpg',
      'description': 'Kerusakan akibat gigitan serangga pada daun mawar dapat disebabkan oleh berbagai hama seperti ulat, belalang, kumbang, atau kutu daun. Kerusakan ini dapat mengurangi kemampuan fotosintesis tanaman dan membuat tanaman lebih rentan terhadap infeksi sekunder.',
      'symptoms': [
        'Lubang-lubang tidak beraturan pada daun',
        'Tepi daun yang sobek atau berlubang',
        'Kerusakan pola gigitan yang khas',
        'Daun berlubang atau terpotong sebagian',
        'Kadang ditemukan serangga pada tanaman'
      ],
      'causes': [
        'Serangan ulat pemakan daun',
        'Infestasi kumbang atau belalang',
        'Kehadiran kutu daun yang menghisap cairan',
        'Hama lain seperti thrips atau tungau',
        'Kurangnya predator alami di area tanaman'
      ],
      'treatments': [
        'Buang serangga secara manual jika memungkinkan',
        'Aplikasikan insektisida organik atau kimia',
        'Gunakan perangkap serangga',
        'Semprotkan larutan sabun insektisida',
        'Tanam tanaman pengusir hama di sekitarnya',
        'Dorong kehadiran predator alami seperti kepik'
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Pustaka Penyakit'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Jelajahi database penyakit daun mawar',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari penyakit...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: diseases.length,
              itemBuilder: (context, index) {
                final disease = diseases[index];
                Color severityColor = disease['severity'] == 'TINGGI'
                    ? Colors.red
                    : disease['severity'] == 'SEDANG'
                        ? Colors.orange
                        : Colors.green;
                
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiseaseDetailPage(
                            disease: disease,
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(disease['imagePath']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      disease['name'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      disease['latin'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: severityColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  disease['severity'],
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
                            disease['description'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}