// Testes de widget do Tradutor de Palavras.
// Cobrem o fluxo principal: exibir palavra, mostrar tradução e navegar.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tradutor/main.dart';

void main() {
  testWidgets('Exibe a primeira palavra em portugues ao iniciar',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TradutorApp());

    expect(find.text('Português'), findsOneWidget);
    expect(find.text('Casa'), findsOneWidget);
    // A traducao so aparece apos o clique.
    expect(find.text('House'), findsNothing);
  });

  testWidgets('Mostra a traducao ao tocar em "Mostrar tradução"',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TradutorApp());

    await tester.tap(find.text('Mostrar tradução'));
    await tester.pump();

    expect(find.text('House'), findsOneWidget); // ingles
    expect(find.text('Casa'), findsWidgets); // portugues + espanhol
  });

  testWidgets('Navega para a proxima palavra e reinicia a traducao',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TradutorApp());

    await tester.tap(find.text('Próxima'));
    await tester.pump();

    expect(find.text('Cachorro'), findsOneWidget);
    // Ao trocar de palavra, a traducao volta a ficar oculta.
    expect(find.text('Dog'), findsNothing);
  });

  testWidgets('Lista circular: "Anterior" na primeira palavra vai para a ultima',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TradutorApp());

    await tester.tap(find.text('Anterior'));
    await tester.pump();

    // Ultima palavra da lista.
    expect(find.text('Trabalho'), findsOneWidget);
  });
}
