// lib/models/prediction_model.dart

// Model untuk menampung response dari endpoint /predict-image/
// Contoh response JSON dari backend:
// {
//   "message": "Prediction successful",
//   "prediction": {
//     "class": "Rose_Rust",
//     "confidence": 0.9876
//   }
// }
class ImagePredictionResult {
  final String message;
  final PredictionDetail? prediction; // Bisa null jika response tidak lengkap

  ImagePredictionResult({required this.message, required this.prediction});

  // Factory constructor untuk membuat objek dari JSON
  factory ImagePredictionResult.fromJson(Map<String, dynamic> json) {
    // Ambil objek 'prediction' dari JSON. Jika tidak ada, akan bernilai null.
    final predictionMap = json['prediction'];

    return ImagePredictionResult(
      // Gunakan ?? untuk memberikan nilai default jika 'message' tidak ada
      message: json['message'] ?? 'Tidak ada pesan dari server',
      // Buat objek PredictionDetail jika map-nya ada, jika tidak, isi dengan null
      prediction: predictionMap != null 
          ? PredictionDetail.fromJson(predictionMap) 
          : null,
    );
  }
}

class PredictionDetail {
  // 'class' adalah reserved keyword di Dart, jadi kita gunakan 'className'
  final String className;
  final double confidence;

  PredictionDetail({required this.className, required this.confidence});

  factory PredictionDetail.fromJson(Map<String, dynamic> json) {
    return PredictionDetail(
      // Mapping dari key 'class' di JSON ke property 'className' di Dart
      // Beri nilai default jika 'class' tidak ada di JSON
      className: json['class'] ?? 'Penyakit Tidak Diketahui',
      // Beri nilai default 0.0 jika 'confidence' tidak ada dan pastikan tipenya double
      confidence: (json['confidence'] ?? 0.0).toDouble(),
    );
  }
}


// Model untuk menampung response dari endpoint /predict/
// Contoh response JSON dari backend:
// {
//   "message": "Data received",
//   "prediction": "Rose_Rust"
// }
class DataPredictionResult {
  final String message;
  final String prediction;

  DataPredictionResult({required this.message, required this.prediction});

  factory DataPredictionResult.fromJson(Map<String, dynamic> json) {
    return DataPredictionResult(
      message: json['message'] ?? 'Tidak ada pesan dari server',
      prediction: json['prediction'] ?? 'Prediksi gagal',
    );
  }
}