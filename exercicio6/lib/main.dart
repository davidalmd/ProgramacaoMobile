import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exercicio6/models/item.dart';
import 'favorite_items.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteItems(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Items',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 6 - David Almeida'),
      ),
      body: Consumer<FavoriteItems>(
        builder: (context, favoriteItems, child) {
          return ListView.builder(
            itemCount: favoriteItems.items.length,
            itemBuilder: (context, index) {
              final item = favoriteItems.items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descrição: ${item.description}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Data de criação: ${item.createdAt}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _editItemDialog(context, favoriteItems, item);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _removeItemDialog(context, favoriteItems, item);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItemDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController = TextEditingController();
        TextEditingController descriptionController = TextEditingController();
        return AlertDialog(
          title: const Text('Adicionar Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: descriptionController,
                decoration:
                    const InputDecoration(labelText: 'Descrição'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Adicionar'),
              onPressed: () {
                String itemName = nameController.text;
                String itemDescription = descriptionController.text;
                if (itemName.isNotEmpty && itemDescription.isNotEmpty) {
                  Provider.of<FavoriteItems>(context, listen: false).addItem(
                    Item(
                      name: itemName,
                      description: itemDescription,
                      createdAt: '${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}',
                    ),
                  );
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editItemDialog(
      BuildContext context, FavoriteItems favoriteItems, Item item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController =
            TextEditingController(text: item.name);
        TextEditingController descriptionController =
            TextEditingController(text: item.description);
        return AlertDialog(
          title: const Text('Editar Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration:
                    const InputDecoration(labelText: 'Descrição'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Salvar'),
              onPressed: () {
                String itemName = nameController.text;
                String itemDescription = descriptionController.text;
                if (itemName.isNotEmpty && itemDescription.isNotEmpty) {
                  favoriteItems.editItem(
                    item,
                    Item(
                      name: itemName,
                      description: itemDescription,
                      createdAt: item.createdAt,
                    ),
                  );
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _removeItemDialog(
      BuildContext context, FavoriteItems favoriteItems, Item item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Deletar'),
          content: Text('Você tem certeza que quer deletar "${item.name}"?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Deletar'),
              onPressed: () {
                favoriteItems.removeItem(item);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
