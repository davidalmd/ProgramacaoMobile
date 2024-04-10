import 'package:exercicio5/KanyeQuotePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 5 - David Almeida',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KanyeQuotePage(),
    );
  }
}
