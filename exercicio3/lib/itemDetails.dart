import 'package:flutter/material.dart';
import 'package:exercicio3/models/item.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Item item;

  const ItemDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              item.imageUrl,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              item.title,
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              item.description,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
