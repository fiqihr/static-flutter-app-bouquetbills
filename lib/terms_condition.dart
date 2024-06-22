import 'package:flutter/material.dart';
import 'package:project_app/resources/color.dart';

class termsCondition extends StatelessWidget {
  const termsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: Text(
          'Terms & Condition',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            'Syarat dan Ketentuan Penggunaan BouquetBills',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\nPendaftaran dan Akun:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Dengan mendaftar, Anda setuju untuk memberikan informasi yang akurat dan menjaga keamanan akun BouquetBills Anda.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '\nPenggunaan Aplikasi:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Aplikasi BouquetBills hanya boleh digunakan untuk tujuan yang sah dan sesuai dengan ketentuan hukum yang berlaku.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '\nKeamanan Informasi:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Kami berkomitmen menjaga keamanan data Anda. Namun, pengguna juga bertanggung jawab untuk melindungi informasi akun mereka.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '\nPembayaran:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Pembayaran harus dilakukan sesuai dengan tagihan yang dihasilkan oleh BouquetBills. Kesalahan pembayaran harus segera dilaporkan.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '\nPembaruan Aplikasi:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Pastikan untuk selalu memperbarui aplikasi BouquetBills agar dapat mengakses fitur terbaru dan perbaikan keamanan.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '\nPerubahan Syarat dan Ketentuan:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'BouquetBills berhak untuk mengubah syarat dan ketentuan ini. Pemberitahuan akan diberikan melalui aplikasi.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '\nDengan menggunakan BouquetBills, Anda menyetujui dan tunduk pada semua syarat dan ketentuan ini. Harap baca dengan seksama sebelum menggunakan layanan kami.',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
