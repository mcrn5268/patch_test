import 'package:flutter/material.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell'),
      ),
      body: Center(
        child: Text('Sell your products here!'),
      ),
    );
  }
}
