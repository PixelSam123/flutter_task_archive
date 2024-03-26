import 'package:flutter/material.dart';

class XBeautyPage extends StatelessWidget {
  XBeautyPage({super.key});

  final _pageColorScheme = ColorScheme.fromSeed(seedColor: Colors.pink);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _pageColorScheme.inversePrimary,
        title: const Text('X BEAUTY'),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.people),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 768.0,
            minHeight: double.infinity,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/zoom75.webp',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ROMAND GLASTING LIP BALM',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  'Rp 100.000,-',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'The Glasting Melting balm is a moisturizing balm with '
                        'plant-based moisturizing oil that does not dry out! '
                        'It provides a transparent and smooth watery glow '
                        'without feeling stuffy.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        shape: const CircleBorder(),
        backgroundColor: _pageColorScheme.primary,
        foregroundColor: _pageColorScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
