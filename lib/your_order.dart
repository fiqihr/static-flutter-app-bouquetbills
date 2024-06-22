import 'package:flutter/material.dart';
import 'package:project_app/resources/color.dart';
import 'package:project_app/data_holder.dart';
import 'package:project_app/detail_order.dart';

class yourOrder extends StatefulWidget {
  double totalPrice = DataHolder.totalPrices;
  List<String> bouquetNames = DataHolder.bouquetNames;
  List<String> bouquetPrices = DataHolder.bouquetPrices;

  yourOrder({Key? key}) : super(key: key);

  @override
  State<yourOrder> createState() => _yourOrderState();
}

class _yourOrderState extends State<yourOrder> {
  List<bool> isButtonClickedList =
      List.filled(DataHolder.checkoutHistory.length, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Pesanan Anda',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: DataHolder.checkoutHistory.isEmpty
            ? Center(
                child: Text('Belum melakukan transaksi'),
              )
            : ListView.builder(
                itemCount: DataHolder.checkoutHistory.length,
                itemBuilder: (BuildContext context, int index) {
                  CheckoutData checkoutData = DataHolder.checkoutHistory[index];
                  bool isButtonClicked = isButtonClickedList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Jumlah total harga: Rp. ${checkoutData.totalPrice.toInt()}'),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                // Mengubah status tombol saat diklik
                                                checkoutData.isButtonClicked =
                                                    !checkoutData
                                                        .isButtonClicked;
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  checkoutData.isButtonClicked
                                                      ? Colors.green
                                                      : Colors.yellow,
                                            ),
                                            child: Text(
                                              checkoutData.isButtonClicked
                                                  ? 'Telah Selesai'
                                                  : 'Selesaikan',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
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
                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Center(
                                child: Text(
                                  'Detail Pesanan ${index + 1}',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TransactionDetailPage(
                                      transactionIndex: index,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
