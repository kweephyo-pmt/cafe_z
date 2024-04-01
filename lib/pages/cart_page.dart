import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cafe_z/components/coffee_tile.dart';
import 'package:cafe_z/models/coffee.dart';
import 'package:cafe_z/models/coffee_shop.dart';
import 'package:cafe_z/pages/qr_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  void payNow() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final coffeeShop = Provider.of<CoffeeShop>(context);

    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.userCart[index];
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => coffeeShop.removeItemFromCart(eachCoffee),
                      icon: const Icon(Icons.delete),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  payNow(); // Navigate to the QR page for payment
                },
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Total Price: ${coffeeShop.totalCartPrice.toStringAsFixed(2)} Baht",
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Pay Now",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
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
