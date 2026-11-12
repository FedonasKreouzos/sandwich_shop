import 'package:flutter/material.dart';
import 'package:sandwich_shop/models/sandwich.dart';

class OrderScreen extends StatefulWidget {
  final Sandwich sandwich;
  final int maxQuantity;

  const OrderScreen({
    super.key,
    required this.sandwich,
    this.maxQuantity = 10,
  });

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() {
        _quantity++;
      });
    }
  }

  void _decreaseQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order ${widget.sandwich.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              widget.sandwich.imagePath,
              width: 200,
              height: 150,
              fit: BoxFit.cover,
           ),

            const SizedBox(height: 20),

            OrderItemDisplay(
              _quantity,
              widget.sandwich.name,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _increaseQuantity,
                  child: const Text('Add'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _decreaseQuantity,
                  child: const Text('Remove'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;

  const OrderItemDisplay(
    this.quantity,
    this.itemType, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$quantity $itemType sandwich(es): ${'🥪' * quantity}',
    );
  }
}