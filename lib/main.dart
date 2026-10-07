import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/simple_provider_screen.dart';

void main() {
  // ProviderScope must wrap the whole app, or providers will not work.
  runApp(const ProviderScope(child: RiverpodSessionApp()));
}

class RiverpodSessionApp extends StatelessWidget {
  const RiverpodSessionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Session',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)),
        useMaterial3: true,
      ),
      home: const SimpleProviderScreen(),
    );
  }
}
