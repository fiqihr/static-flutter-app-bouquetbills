import 'package:flutter/material.dart';
import 'package:project_app/cart.dart';
import 'package:project_app/checkout.dart';
import 'package:provider/provider.dart';

import 'package:project_app/model/bouquet_list.dart';
import 'package:project_app/resources/color.dart';

class cartPage extends StatelessWidget {
  const cartPage({
    super.key,
  });

  // remove from cart
  void removeFromCart(bouquet mycart, BuildContext context) {
    final belanja = context.read<Cart>();
    belanja.removeFromCart(mycart);
  }

  void navigateToCheckoutPage(
    BuildContext context,
    double total,
    List<String> bouquetNames,
    List<String> bouquetPrices,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => checkoutPage(
          totalPrice: total,
          bouquetNames: bouquetNames,
          bouquetPrices: bouquetPrices,
        ),
      ),
    );
  }

  double calculateTotalPrice(List<bouquet> cart) {
    double totalPrice = 0.0;
    for (var item in cart) {
      totalPrice += double.parse(item.price); // Konversi harga menjadi double
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Keranjang Saya',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final bouquet mycart = value.cart[index];
                  final String bouquetName = mycart.name;
                  final String bouquetPrice = mycart.price;
                  // list tile
                  return Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(
                      left: 20,
                      top: 20,
                      right: 20,
                    ),
                    child: ListTile(
                      title: Text(bouquetName),
                      subtitle: Text('Rp. ${bouquetPrice}'),
                      trailing: IconButton(
                        onPressed: () => removeFromCart(mycart, context),
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
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
                    double total = calculateTotalPrice(value.cart);
                    List<String> bouquetNames =
                        value.cart.map((item) => item.name).toList();
                    List<String> bouquetPrices =
                        value.cart.map((item) => item.price).toList();
                    navigateToCheckoutPage(
                      context,
                      total,
                      bouquetNames,
                      bouquetPrices,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Check Out   ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
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
          // pembayaran
        ),
      ),
    );
  }
}
