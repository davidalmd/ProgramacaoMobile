import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class KanyeQuotePage extends StatefulWidget {
  const KanyeQuotePage({super.key});

  @override
  _KanyeQuotePageState createState() => _KanyeQuotePageState();
}

class _KanyeQuotePageState extends State<KanyeQuotePage> {
  var _kanyeQuote;

  @override
  void initState() {
    super.initState();
    fetchKanyeQuote();
  }

  Future<void> fetchKanyeQuote() async {
    final response = await http.get(Uri.parse('https://api.kanye.rest'));
    if (response.statusCode == 200) {
      setState(() {
        _kanyeQuote = json.decode(response.body)['quote'];
      });
    } else {
      throw Exception('Falha ao carregar a api KanyeRest');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/kanyeLogo.png',
              fit: BoxFit.cover,
              height: 50,
            ),
            const SizedBox(width: 10),
            const Text(
              'Frases \ndo Kanye West',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/kanye.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Center(
              child: _kanyeQuote == null
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Kanye Quote:\n\n"$_kanyeQuote"',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
            ),
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: fetchKanyeQuote,
        label: const Text('Gerar nova frase'),
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
