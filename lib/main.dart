import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Sandwich Shop App',
    home: Scaffold(
      appBar: AppBar(title: const Text('Sandwich Counter')),
      body: Center(
        child: OrderItemDisplay(5, 'Footlong'),
      ),
    ),
  );
}
}
class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;

   // ignore: prefer_const_constructors_in_immutables
  OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
Widget build(BuildContext context) {
  return Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}');
}
}