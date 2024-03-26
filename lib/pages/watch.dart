import 'package:flutter/material.dart';

class WatchPage extends StatelessWidget {
  WatchPage({super.key});

  final _pageColorScheme = ColorScheme.fromSeed(seedColor: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DETAILS',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.shopping_bag_outlined),
          SizedBox(width: 12.0),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 768.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/jamtangan.webp',
                        width: double.infinity,
                        height: 420.0,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'MADISON',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ),
                                Icon(Icons.favorite_border_outlined),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    '\$125',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ),
                                const Icon(Icons.star, size: 20.0),
                                const Icon(Icons.star, size: 20.0),
                                const Icon(Icons.star, size: 20.0),
                                const Icon(Icons.star, size: 20.0),
                                const Icon(Icons.star_half, size: 20.0),
                                const SizedBox(width: 16.0),
                                Text(
                                  '944 Reviews',
                                  style: TextStyle(
                                    color: _pageColorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'Make your casual style more fashionable with the '
                              'Elegant Minimalist Leather Wristwatch! The sleek '
                              'look of the watch paired with its handcrafted '
                              'leather band makes for.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: _pageColorScheme.secondary,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 120.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _pageColorScheme.secondaryContainer,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 4.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.remove,
                              color: _pageColorScheme.secondary,
                            ),
                            const Text('01'),
                            Icon(
                              Icons.add,
                              color: _pageColorScheme.secondary,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _pageColorScheme.secondary,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            'ADD TO CART',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _pageColorScheme.onSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
