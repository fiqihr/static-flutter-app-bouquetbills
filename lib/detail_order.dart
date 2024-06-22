import 'package:flutter/material.dart';
import 'package:project_app/data_holder.dart';
import 'package:project_app/resources/color.dart';

class TransactionDetailPage extends StatelessWidget {
  final int transactionIndex;

  TransactionDetailPage({required this.transactionIndex});

  @override
  Widget build(BuildContext context) {
    CheckoutData checkoutData = DataHolder.checkoutHistory[transactionIndex];
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          'Detail Transaksi',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Card(
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: 400,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: ListView(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      child: Image(
                                        image: AssetImage(
                                            'images/logo-BouquetBills.png'),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        ' BouquetBills',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Transaksi ${transactionIndex + 1} - ',
                                      ),
                                      Flexible(
                                        child: Text(
                                          '${DataHolder.nameC.text}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: Colors.black),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('  Nama Barang:'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0;
                                            i <
                                                checkoutData
                                                    .bouquetNames.length;
                                            i++)
                                          Text(
                                            '   - ${checkoutData.bouquetNames[i]}  ',
                                          ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0;
                                            i <
                                                checkoutData
                                                    .bouquetPrices.length;
                                            i++)
                                          Text(
                                            'Rp. ${checkoutData.bouquetPrices[i]}  ',
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Text('  Ongkos Kirim')),
                                  Flexible(child: Text('Rp. 0  ')),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  '  Total',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  'Rp. ${checkoutData.totalPrice.toInt()}  ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Klik Selesaikan di halaman sebelumnya jika pesananmu sudah selesai',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
