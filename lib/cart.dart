import 'model/bouquet_list.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  final List<bouquet> _bouquetMenu = [
    bouquet(
      name: 'abcdef',
      description: 'daysdgus suydgf saydfgs ydfgaoooiuwerfh f adf sapfghsadog',
      price: '20000',
      imgAsset: 'images/flower-logo.png',
    ),
  ];

  // customer cart
  List<bouquet> _cart = [];

  //getter method
  List<bouquet> get bouquetMenu => _bouquetMenu;
  List<bouquet> get cart => _cart;

  // add to cart
  void addToCart(bouquet bouquetItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(bouquetItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(bouquet mycart) {
    _cart.remove(mycart);
    notifyListeners();
  }
}
