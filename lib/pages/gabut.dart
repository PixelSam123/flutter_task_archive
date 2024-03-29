import 'package:flutter/material.dart';

class GabutPage extends StatelessWidget {
  GabutPage({super.key});

  final _pageColorScheme = ColorScheme.fromSeed(seedColor: Colors.purple);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _pageColorScheme.inversePrimary,
        title: const Text('Aku Gabut Cok'),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      body: const Center(
        child: Text('AKU GABUT COK'),
      ),
    );
  }
}
