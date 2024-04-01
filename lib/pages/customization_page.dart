import 'package:flutter/material.dart';
import 'package:cafe_z/models/coffee.dart'; 

class CustomizationPage extends StatefulWidget {
  final Coffee coffee;

  const CustomizationPage({Key? key, required this.coffee}) : super(key: key);

  @override
  _CustomizationPageState createState() => _CustomizationPageState();
}

class _CustomizationPageState extends State<CustomizationPage> {
  int _quantity = 1;
  String _cupSize = 'M'; // Default cup size

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize Your Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Coffee: ${widget.coffee.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Quantity:',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: _decreaseQuantity,
                ),
                Text('$_quantity'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _increaseQuantity,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Select Cup Size:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: _cupSize,
              onChanged: (String? newValue) {
                setState(() {
                  _cupSize = newValue!;
                });
              },
              items: <String>['S', 'M', 'L'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to add the customized coffee to the cart
                // You can use Provider or another state management solution to handle this
                Navigator.pop(context);
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

