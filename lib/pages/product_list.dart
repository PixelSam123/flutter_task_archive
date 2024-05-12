import 'package:flutter/material.dart';
import 'package:flutter_task_archive/pages/product_list/cotton_shirt.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink).copyWith(
          primary: const Color(0xFFFC465D),
          tertiary: const Color(0xFFA0A0A0),
          tertiaryContainer: const Color(0xFFF4F4F6),
          surface: const Color(0xFFFFFFFF),
        ),
        disabledColor: const Color(0xFFD2D2D2),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      ),
      child: const ProductListPageContent(),
    );
  }
}

class ProductListPageContent extends StatelessWidget {
  const ProductListPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('Product List'),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12.0),
              children: [
                /* searchbar */
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(63),
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search),
                      const SizedBox(width: 8.0),
                      Container(
                        width: 2.0,
                        height: 20.0,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 8.0),
                      const Text('Search Your Product'),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                /* category */
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text('See All'),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _Category(
                      icon: Symbols.apparel,
                      text: 'Apparel',
                      isActive: true,
                    ),
                    _Category(
                      icon: Symbols.steps,
                      text: 'Shoe',
                      isActive: false,
                    ),
                    _Category(
                      icon: Symbols.health_and_beauty,
                      text: 'Beauty',
                      isActive: false,
                    ),
                    _Category(
                      icon: Icons.memory,
                      text: 'Electric',
                      isActive: false,
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                /* the actual list */
                const _Product(
                  name: 'Cotton Shirt',
                  description:
                      'This is 100% cotton shirt which is made by Bangladesh',
                  originalPrice: 150,
                  discountPrice: 112,
                ),
                const SizedBox(height: 12.0),
                const _Product(
                  name: 'Cotton Shirt',
                  description:
                      'This is 100% cotton shirt which is made by Bangladesh',
                  originalPrice: 150,
                  discountPrice: 112,
                ),
                const SizedBox(height: 12.0),
                const _Product(
                  name: 'Cotton Shirt',
                  description:
                      'This is 100% cotton shirt which is made by Bangladesh',
                  originalPrice: 150,
                  discountPrice: 112,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(63),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _FooterItem(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  isActive: true,
                ),
                _FooterItem(
                  icon: Icons.shopping_cart_outlined,
                  text: 'Cart',
                  isActive: false,
                ),
                _FooterItem(
                  icon: Icons.favorite_outline,
                  text: 'Favorite',
                  isActive: false,
                ),
                _FooterItem(
                  icon: Icons.menu,
                  text: 'More',
                  isActive: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Category extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isActive;

  const _Category({
    required this.icon,
    required this.text,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color:
                isActive ? Colors.pink : Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(63),
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Icon(
            icon,
            size: 48.0,
            color: isActive ? Colors.white : null,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(text, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _FooterItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isActive;

  const _FooterItem({
    required this.icon,
    required this.text,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: isActive ? Colors.pink : null),
        Text(text, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _Product extends StatelessWidget {
  final String name;
  final String description;
  final int originalPrice;
  final int discountPrice;

  const _Product({
    required this.name,
    required this.description,
    required this.originalPrice,
    required this.discountPrice,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CottonShirtPage()),
        );
      },
      child: Row(
        children: [
          Container(
            width: 112.0,
            height: 128.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(description, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '\$$originalPrice',
                          style: TextStyle(
                            color: Theme.of(context).disabledColor,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Theme.of(context).disabledColor,
                          ),
                        ),
                        Text(
                          '\$$discountPrice',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.pink,
                                  ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Color'),
                        Row(
                          children: [
                            Colors.blue,
                            Colors.red,
                            Colors.yellow,
                          ].map((color) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                color: color,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
