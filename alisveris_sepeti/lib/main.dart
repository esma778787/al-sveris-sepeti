import 'package:flutter/material.dart';

void main() => runApp(ShoppingApp());

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alışveriş Sepeti',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int _totalPrice = 0;
  List<String> _cartItems = [];

  void _addItem(String itemName, int price) {
    setState(() {
      _cartItems.add(itemName);
      _totalPrice += price;
    });
  }

  void _removeItem(String itemName, int price) {
    setState(() {
      _cartItems.remove(itemName);
      _totalPrice -= price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alışveriş Sepeti'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return ListTile(
                  title: Text(item),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      _removeItem(item, 50); // Örnek olarak her ürün 50 birim fiyatında
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.blueGrey[50],
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Toplam Tutar:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$_totalPrice ₺',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                _addItem('Ürün', 50); // Örnek olarak her ürün 50 birim fiyatında
              },
              child: Text('Ürün Ekle'),
            ),
          ),
        ],
      ),
    );
  }
}
