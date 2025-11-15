// File helper untuk data penyakit
// Letakkan di: lib/src/disease_data.dart

class DiseaseData {
  static final List<Map<String, dynamic>> diseases = [
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

  // Method untuk mendapatkan penyakit berdasarkan nama
  static Map<String, dynamic>? getDiseaseByName(String name) {
    try {
      return diseases.firstWhere(
        (disease) => disease['name'] == name,
      );
    } catch (e) {
      return null;
    }
  }

  // Method untuk simulasi hasil deteksi AI
  static Map<String, dynamic> getRandomDetection() {
    // Dalam implementasi nyata, ini akan diganti dengan hasil dari model AI
    // Untuk contoh, kita return penyakit pertama (Karat Mawar)
    final disease = diseases[0];
    return {
      ...disease,
      'confidence': '92%',
    };
  }
}