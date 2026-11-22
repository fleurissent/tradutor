// N1-E4 / N1-E5 - Tradutor de Palavras
// Linguas: Portugues (principal), Ingles e Espanhol
// Biblioteca externa (pub.dev): flutter_tts - fala a palavra em voz alta

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const TradutorApp());
}

class Palavra {
  final String portugues;
  final String ingles;
  final String espanhol;

  Palavra(this.portugues, this.ingles, this.espanhol);
}

final List<Palavra> palavras = [
  Palavra('Casa', 'House', 'Casa'),
  Palavra('Cachorro', 'Dog', 'Perro'),
  Palavra('Livro', 'Book', 'Libro'),
  Palavra('Água', 'Water', 'Agua'),
  Palavra('Comida', 'Food', 'Comida'),
  Palavra('Janela', 'Window', 'Ventana'),
  Palavra('Cadeira', 'Chair', 'Silla'),
  Palavra('Rua', 'Street', 'Calle'),
  Palavra('Cidade', 'City', 'Ciudad'),
  Palavra('Amigo', 'Friend', 'Amigo'),
  Palavra('Escola', 'School', 'Escuela'),
  Palavra('Trabalho', 'Work', 'Trabajo'),
];

class TradutorApp extends StatelessWidget {
  const TradutorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tradutor de Palavras',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const TelaTradutor(),
    );
  }
}

class TelaTradutor extends StatefulWidget {
  const TelaTradutor({super.key});

  @override
  State<TelaTradutor> createState() => _TelaTradutorState();
}

class _TelaTradutorState extends State<TelaTradutor> {
  int indiceAtual = 0;
  bool mostrarTraducao = false;
  final FlutterTts tts = FlutterTts();

  // fala a palavra atual em portugues usando a biblioteca flutter_tts
  void ouvirPalavra() async {
    await tts.setLanguage('pt-BR');
    await tts.speak(palavras[indiceAtual].portugues);
  }

  void proximaPalavra() {
    setState(() {
      // lista circular: depois da ultima volta pra primeira
      indiceAtual = (indiceAtual + 1) % palavras.length;
      mostrarTraducao = false;
    });
  }

  void palavraAnterior() {
    setState(() {
      // na primeira, Anterior vai pra ultima
      indiceAtual = (indiceAtual - 1 + palavras.length) % palavras.length;
      mostrarTraducao = false;
    });
  }

  void exibirTraducao() {
    setState(() {
      mostrarTraducao = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final palavra = palavras[indiceAtual];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tradutor de Palavras'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Português',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              palavra.portugues,
              style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            if (mostrarTraducao) ...[
              const Text(
                'Inglês',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                palavra.ingles,
                style: const TextStyle(fontSize: 30, color: Colors.teal),
              ),
              const SizedBox(height: 16),
              const Text(
                'Espanhol',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                palavra.espanhol,
                style: const TextStyle(fontSize: 30, color: Colors.teal),
              ),
            ],
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: ouvirPalavra,
              icon: const Icon(Icons.volume_up),
              label: const Text('Ouvir'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: palavraAnterior,
                  child: const Text('Anterior'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: exibirTraducao,
                  child: const Text('Mostrar tradução'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: proximaPalavra,
                  child: const Text('Próxima'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
