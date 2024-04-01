import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(name: 'Americano', price: 60.0, imagePath: 'lib/images/americano.png'),
    Coffee(name: 'Latte', price: 65.0, imagePath: 'lib/images/latte.png'),
    Coffee(name: 'Espresso', price: 60.0, imagePath: 'lib/images/expresso.png'),
    Coffee(name: 'Iced Coffee', price: 55.0, imagePath: 'lib/images/iced_coffee.png'),
    Coffee(name: 'Iced Lemon Tea', price: 55.0, imagePath: 'lib/images/lemon_tea.png'),
    Coffee(name: 'Cappuccino', price: 65.0, imagePath: 'lib/images/cappuccino.png'),
    Coffee(name: 'Mocha', price: 65.0, imagePath: 'lib/images/mocha.png'),
    Coffee(name: 'Signature Burger', price: 80.0, imagePath: 'lib/images/burger.png'),
    Coffee(name: 'Sandwich', price: 70.0, imagePath: 'lib/images/sandwich.png'),
    Coffee(name: 'French Fries', price: 70.0, imagePath: 'lib/images/french-fries.png'),
  
  ];

  final List<Coffee> _userCart = [];

  List<Coffee> get coffeeShop => _shop;

  List<Coffee> get userCart => _userCart;

  double get totalCartPrice {
    double totalPrice = 0.0;
    for (Coffee coffee in _userCart) {
      totalPrice += coffee.price;
    }
    return totalPrice;
  }

  void addItemToCart(Coffee coffee, quantity) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}