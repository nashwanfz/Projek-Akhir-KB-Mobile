# 🌹 MawarSehat AI

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Django](https://img.shields.io/badge/Django-092E20?style=for-the-badge&logo=django&logoColor=white)
![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white)

Aplikasi mobile untuk mendeteksi penyakit pada daun bunga mawar menggunakan teknologi Artificial Intelligence (AI).

[📖 Lihat Dokumentasi](#-dokumentasi) • [🚀 Mulai](#-mulai) • [📱 Cara Penggunaan](#-cara-menggunakan-aplikasi)

</div>

## 📝 Tentang

*MawarSehat AI* adalah solusi inovatif untuk para pecinta bunga mawar. Dengan menggunakan teknologi image classification, pengguna cukup mengunggah foto daun mawar, dan aplikasi akan secara otomatis menganalisisnya untuk menampilkan jenis penyakit, tingkat keyakinan prediksi, serta saran penanganan yang tepat.

Aplikasi ini juga dilengkapi dengan fitur *Pustaka Penyakit* yang berisi informasi lengkap mengenai berbagai penyakit daun mawar untuk edukasi dan pencegahan.

## ✨ Fitur Utama

📌 *1. Deteksi Penyakit Daun Mawar*
*   Unggah atau ambil foto daun mawar langsung dari aplikasi.
*   AI akan menganalisis gambar secara otomatis dan cepat.
*   Menampilkan hasil lengkap:
    *   Nama penyakit (misalnya: Rose Rust, Rose Sawfly, dll.).
    *   Confidence score (%) dari hasil prediksi.
    *   Saran penanganan praktis (pemotongan daun, penggunaan fungisida, dll.).

📌 *2. Pustaka Penyakit*
*   Menyediakan daftar penyakit daun mawar lengkap beserta deskripsi dan gambar ilustrasi.
*   Termasuk kategori seperti:
    *   Karat Mawar (Phragmidium mucronatum)
    *   Daun Sehat (Healthy)
    *   Penyakit lain sesuai dataset AI.

📌 *3. Mode Guest*
*   Pengguna dapat langsung memakai semua fitur utama aplikasi tanpa perlu mendaftar atau login.
*   Mudah, cepat, dan tanpa hambatan.

📌 *4. UI/UX Modern*
*   Tampilan aplikasi yang sederhana, bersih, dan intuitif.
*   Didukung dengan tips foto terbaik untuk memastikan hasil deteksi lebih akurat.

## 🖼 Screenshots

(Ganti dengan screenshot aplikasi Anda)

 * Tampilan Halaman Utama
   ![Home](https://github.com/user-attachments/assets/ea768f65-ee54-43b4-8387-8cbb9189ecf1)
 * Tampilan Upload Foto
   ![Uploa](https://github.com/user-attachments/assets/c2642af0-a014-4367-84ae-e987799c4cba)
 * Tampilan Result
   ![Result](https://github.com/user-attachments/assets/6d0f748a-7f00-4693-9bc8-64edce0b198e)

---

## 🚀 Mulai

Untuk menjalankan proyek ini secara lokal, Anda perlu menjalankan backend (Django) dan frontend (Flutter).

### Prasyarat Umum
*   *Flutter SDK* (versi 3.0 atau lebih baru)
*   *Conda* (Miniconda atau Anaconda)
*   *Python* (sudah termasuk dalam distribusi Conda)
*   *Git*

---

### 🧑‍💻 Backend (Django)

Server backend berfungsi untuk menjalankan model AI, menerima gambar dari aplikasi mobile, dan mengembalikan hasil prediksi.

1.  *Clone Repository*
    bash
    git clone <URL_REPOSITORY_BACKEND_ANDA>
    cd <nama_folder_backend>
    

2.  *Aktivasi Lingkungan Conda*
    *   Aktifkan environment Conda yang sudah Anda siapkan:
        bash
    *   conda env create -n <nama-env-baru> -f environment.yml
    *   conda activate <nama-env-baru>
	*	python manage.py runserver
        

3.  *Instalasi Dependensi*
    *   Instal pustaka yang dibutuhkan satu per satu menggunakan `pip

4.  *Konfigurasi*
    *   Pastikan file settings.py sudah dikonfigurasi dengan benar, terutama untuk CORS agar aplikasi Flutter dapat terhubung.

5.  *Jalankan Server*
    bash
    python manage.py runserver
    
    Server akan berjalan di http://127.0.0.1:8000/.

---

### 📱 Frontend (Flutter)

1.  *Clone Repository*
    bash
    git clone <URL_REPOSITORY_FLUTTER_ANDA>
    cd <nama_folder_flutter>
    

2.  *Instal Dependensi*
    bash
    flutter pub get
    

3.  *Konfigurasi URL API*
    Buka file lib/services/api_service.dart dan ubah baseUrl:
    *   Untuk pengujian di *emulator/device, gunakan URL dari **ngrok* (lihat langkah tambahan di bawah).
    dart
    // lib/services/api_service.dart
    class ApiService {
      final String baseUrl = "https://<URL_NGROK_ANDA>/api"; 
      // ...
    }
    

4.  *Jalankan Aplikasi*
    bash
    flutter run
    

---

### Langkah Tambahan: Menjalankan dengan ngrok

Agar aplikasi Flutter (di emulator/device) dapat mengakses server Django lokal, gunakan *ngrok*.

1.  *Instal ngrok* dari [situs resminya](https://ngrok.com/download).
2.  Jalankan ngrok untuk membuat tunnel ke port 8000:
    bash
    ngrok http 8000
    
3.  Salin URL https yang diberikan oleh ngrok (contoh: https://52392af06326.ngrok-free.app).
4.  Gunakan URL tersebut di file lib/services/api_service.dart pada aplikasi Flutter.

---

## 📖 Cara Menggunakan Aplikasi

1.  *Halaman Welcome*
    *   Buka aplikasi, lalu tekan “Masuk Sebagai Guest”.

2.  *Unggah Foto Daun Mawar*
    *   Tekan tombol *Unggah Foto* atau *Ambil Foto*.
    *   Ikuti tips yang diberikan untuk hasil terbaik:
        *   Pastikan pencahayaan baik.
        *   Fokus pada bagian daun yang bermasalah.
        *   Hindari bayangan.

3.  *Tunggu Proses Analisis*
    *   Aplikasi akan mengirim gambar ke model AI.
    *   Hasil deteksi akan ditampilkan:
        *   Nama penyakit
        *   Persentase keyakinan
        *   Saran penanganan

4.  *Lihat Pustaka Penyakit*
    *   Dari menu utama, buka *Pustaka Penyakit* untuk mempelajari berbagai jenis penyakit daun mawar.

---

## 📂 Teknologi yang Digunakan

*   *Frontend:* Flutter
*   *Backend:* Django
*   *Model AI:* TensorFlow Lite
*   *Environment Management:* Conda
*   *Tunneling untuk Pengujian:* ngrok

---

## 🔗 Link Penting

*   *Google Drive (Dataset / APK / Dokumentasi):* https://drive.google.com/drive/folders/1tvOIhmfXm5p6-HG75NPCvF2wIWrZfpt5

---

## 📄 Lisensi

Proyek ini dilisensikan di bawah Lisensi MIT - lihat file [LICENSE](LICENSE) untuk detailnya.
