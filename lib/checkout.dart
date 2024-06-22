import 'package:flutter/material.dart';
import 'package:project_app/home.dart';
import 'package:project_app/resources/color.dart';
import 'package:project_app/data_holder.dart';
import 'package:project_app/pay.dart';

class checkoutPage extends StatefulWidget {
  final double totalPrice;
  final List<String> bouquetNames;
  final List<String> bouquetPrices;
  final bool isButtonClicked;

  const checkoutPage({
    Key? key,
    required this.totalPrice,
    required this.bouquetNames,
    required this.bouquetPrices,
    this.isButtonClicked = false,
  }) : super(key: key);

  @override
  State<checkoutPage> createState() => _checkoutPageState();
}

Widget displaySavedImage() {
  if (DataHolder.savedFile != null) {
    return Image.file(
      DataHolder.savedFile!,
      fit: BoxFit.cover,
    );
  } else {
    return Center(
      child: Text('Belum ada bukti pembayaran'),
    );
  }
}

class _checkoutPageState extends State<checkoutPage> {
  bool isLoading = false;

  final List data = [
    {
      "judul": " ---",
      "data": 1,
    },
    {
      "judul": " Transfer Bank",
      "data": 2,
    },
    {
      "judul": " COD",
      "data": 3,
    },
  ];

  late int dataAwal = 1;

  void navigateToNewPage(int selectedValue) {
    if (selectedValue == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => transferPay()),
      );
    }
  }

  void tambah() {
    DataHolder.updateData(
      widget.totalPrice,
      widget.bouquetNames,
      widget.bouquetPrices,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Flexible(
                        child: Text('  Alamat Pengiriman'),
                      ),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${DataHolder.storedTextName}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("${DataHolder.storedTextCall}"),
                                    ],
                                  ),
                                ),
                                Card(
                                  color: secondaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      'Rumah',
                                      style: TextStyle(color: primaryColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: primaryColor,
                            ),
                            Text('${DataHolder.storedTextAddress}')
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.details),
                      Flexible(
                        child: Text('  Detail Pesanan'),
                      ),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Jenis Produk :'),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (int i = 0;
                                          i < widget.bouquetNames.length;
                                          i++)
                                        Text(
                                          '${widget.bouquetNames[i]}',
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: primaryColor,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Text('Jumlah Total :')),
                                  Flexible(
                                      child: Text(
                                          'Rp. ${widget.totalPrice.toInt()}'))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.payment),
                      Flexible(
                        child: Text('  Metode Pembayaran'),
                      ),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jumlah yang harus dibayarkan: Rp. ${widget.totalPrice.toInt()}',
                            ),
                            Divider(
                              color: primaryColor,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child: Column(
                                    children: [
                                      Text('Silahkan pilih metode pembayaran'),
                                      DropdownButton<int>(
                                        isExpanded: true,
                                        value: dataAwal,
                                        items: data
                                            .map(
                                              (e) => DropdownMenuItem(
                                                child: Text("${e['judul']}"),
                                                value: e['data'] as int,
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            dataAwal = value!;
                                            navigateToNewPage(value);
                                          });
                                        },
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                          '* Jika memilih metode pembayaran COD pastikan alamat pengiriman sesuai dan siapkan pembayaran tunai sejumlah harga yang harus dibayarkan ya.')
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      height: 120,
                                      width: 120,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 5,
                                          top: 5,
                                          bottom: 5,
                                        ),
                                        child: displaySavedImage(),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          displaySavedImage();
                                        });
                                      },
                                      child: Text(
                                        'Refresh',
                                        style: TextStyle(
                                          color: secondaryColor,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor,
                                        elevation: 5,
                                        shadowColor: Colors.grey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 20,
                right: 20,
              ),
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    tambah();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(
                              color: Colors.grey,
                            ),
                            SizedBox(height: 30),
                            Text("Pesanan diproses"),
                            Text(
                                "Pergi ke menu Profil untuk melihat pesanan anda"),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop(
                                MaterialPageRoute(
                                  builder: (context) => homePage(),
                                ),
                              );
                            },
                            child: Text(
                              "OK",
                              style: TextStyle(color: secondaryColor),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'Selesai Transaksi   ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: secondaryColor,
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    elevation: 5,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
