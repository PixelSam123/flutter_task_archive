import 'package:flutter/material.dart';

class XBeautyPage extends StatelessWidget {
  const XBeautyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
      ),
      child: const XBeautyPageContent(),
    );
  }
}

class XBeautyPageContent extends StatelessWidget {
  const XBeautyPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('X BEAUTY'),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.people, color: Colors.black),
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
          child: ListView(
            children: [
              Image.asset(
                'assets/zoom75.webp',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
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
                                style: Theme.of(context).textTheme.titleMedium,
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
                      textAlign: TextAlign.justify,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
