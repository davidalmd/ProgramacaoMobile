import 'package:flutter/material.dart';
import 'package:exercicio3/models/item.dart';
import 'package:exercicio3/itemDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Item> items = [
    Item(
        title: 'Arco',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhHOvsnjROYr50pzyGFv637FqxqAP54p3X4dbcQ4n-Vw&s',
        description: 'Arco de madeira do Minecraft'),
    Item(
        title: 'Bolo',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrdgWDz7sGiNhbKeR3F7MO4hfhnV2a6tmWNevwEPh_Sg&s',
        description: 'Bolo de cereja e baunilha do Minecraft'),
    Item(
        title: 'Espada',
        imageUrl:
            'https://media.forgecdn.net/avatars/230/289/637059773258434252.png',
        description: 'Espada de ferro do Minecraft'),
    Item(
        title: 'TNT',
        imageUrl:
            'https://as1.ftcdn.net/v2/jpg/04/88/98/06/1000_F_488980653_6dcUx7Ssza77sxVSRZAUqw9NrGwmzadi.jpg',
        description: 'TNT do Minecraft'),
    Item(
        title: 'Tocha',
        imageUrl:
            'https://wiki.hypixel.net/images/6/67/Minecraft_items_torch.png',
        description: 'Tocha de madeira do Minecraft'),
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 3 - David Almeida',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Itens'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].title),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(items[index].imageUrl),
              ),
              onTap: () {
                _showItemDetails(context, items[index]);
              },
            );
          },
        ),
      ),
    );
  }

  void _showItemDetails(BuildContext context, Item item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetailsScreen(item: item),
      ),
    );
  }
}
