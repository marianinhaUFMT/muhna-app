import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'features/acervo/view/acervo_page.dart';

void main() {
  runApp(const ProviderScope(child: MuseuApp()));
}

class MuseuApp extends StatelessWidget {
  const MuseuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App do Museu',
      theme: ThemeData(colorSchemeSeed: Colors.brown, useMaterial3: true),
      // Por enquanto abre direto no módulo do acervo. Quando houver mais
      // módulos, essa tela inicial vira um menu/dashboard que navega para
      // cada um deles.
      home: const AcervoPage(),
    );
  }
}
