import 'package:flutter/material.dart';
import 'package:project_app/resources/color.dart';

class helpCenter extends StatelessWidget {
  const helpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: Text(
          'Help & Center',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            'BouquetBills Help & Center',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\nSelamat datang di Help & Center BouquetBills! Temukan jawaban cepat untuk pertanyaan umum Anda atau hubungi tim dukungan kami.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '\nPertanyaan Umum (FAQ)',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\nBagaimana caranya memesan produk?',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Silahkan pilih produk yang ada di menu dashboard kemudian klik tambahkan ke keranjang, setelah itu pergi ke menu keranjang dan klik check out.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '\nBagaimana caranya melakukan pembayaran?',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Setelah melakukan check out selanjutnya anda akan diarahkan ke halaman pembayaran. Ada 2 pilihan jenis pembayaran yaitu Transfer Bank dan COD. Silahkan pilih sesuai kebutuhan anda dan baca langkah-langkah pembayarannya.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '\nBerapa biaya ongkirnya?',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Ongkir untuk pemesanan pada BouquetBills ini yaitu gratis. Karena toko ini hanya beroperasi di Yogyakarta dan belum ada di kota lain.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '\nPusat Bantuan',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Temukan panduan langkah-demi-langkah dan solusi untuk masalah umum.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '\nHubungi Kami',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Butuh bantuan lebih lanjut? Email kami di support@bouquetbills.com untuk petunjuk yang lebih jelas.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '\nTerima kasih telah memilih BouquetBills!',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
