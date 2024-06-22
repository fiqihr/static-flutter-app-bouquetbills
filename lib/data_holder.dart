import 'package:flutter/material.dart';
import 'dart:io';

class DataHolder {
  static final TextEditingController usernameC = TextEditingController();
  static final TextEditingController nameC = TextEditingController();
  static final TextEditingController emailC = TextEditingController();
  static final TextEditingController callC = TextEditingController();
  static final TextEditingController addressC = TextEditingController();

  static double totalPrices = 0.0;
  static List<String> bouquetNames = [];
  static List<String> bouquetPrices = [];

  static String storedTextUsername = '';
  static String storedTextName = '';
  static String storedTextEmail = '';
  static String storedTextCall = '';
  static String storedTextAddress = '';
  static File? savedFile;
  static File? savedPhotoProfile;

  static List<CheckoutData> checkoutHistory = [];

  static void updateData(
      double totalPrice, List<String> names, List<String> prices) {
    // Menambahkan data checkout baru ke daftar checkoutHistory
    CheckoutData checkoutData = CheckoutData(
      totalPrice: totalPrice,
      bouquetNames: names,
      bouquetPrices: prices,
      isButtonClicked: false,
    );
    checkoutHistory.add(checkoutData);
  }
}

class CheckoutData {
  double totalPrice;
  List<String> bouquetNames;
  List<String> bouquetPrices;
  bool isButtonClicked; // Tambahkan status tombol

  CheckoutData({
    required this.totalPrice,
    required this.bouquetNames,
    required this.bouquetPrices,
    this.isButtonClicked = false, // Inisialisasi status tombol dengan false
  });
}
