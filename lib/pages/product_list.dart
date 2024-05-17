import 'package:flutter/material.dart';
import 'package:flutter_task_archive/pages/product_list/cotton_shirt.dart';
import 'package:flutter_task_archive/types.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink).copyWith(
          primary: const Color(0xFFF35770),
          tertiary: const Color(0xFF999999),
          tertiaryContainer: const Color(0xFFF4F4F6),
          surface: const Color(0xFFFFFFFF),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          hintStyle: TextStyle(color: Color(0xFF999999)),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFF35770),
          selectionColor: Color(0x7FF35770),
        ),
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
    final pageBoxShadow = [
      BoxShadow(
        color: Colors.black.withAlpha(47),
        blurRadius: 4.0,
        offset: const Offset(0.0, 1.0),
      ),
    ];

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
            icon: Icon(
              Icons.filter_alt_outlined,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(child: _ProductsView()),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: pageBoxShadow,
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

class _ProductsView extends StatefulWidget {
  const _ProductsView();

  @override
  State<_ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<_ProductsView> {
  final List<Category> _categories = const [
    Category(
      imagePath: 'assets/apparel.png',
      name: 'Apparel',
    ),
    Category(
      imagePath: 'assets/shoe.png',
      name: 'Shoe',
    ),
    Category(
      imagePath: 'assets/beauty.png',
      name: 'Beauty',
    ),
    Category(
      imagePath: 'assets/electric.png',
      name: 'Electric',
    ),
  ];
  final List<Product> _products = const [
    Product(
      categoryName: 'Apparel',
      name: 'Cotton Shirt',
      description: 'This is 100% cotton shirt which is made by Bangladesh',
      originalPrice: 150,
      discountPrice: 112,
      thumbnailPath: 'assets/cottonshirt.png',
    ),
    Product(
      categoryName: 'Shoe',
      name: 'Ladies Watch',
      description: 'This is 100% cotton shirt which is made by Bangladesh',
      originalPrice: 150,
      discountPrice: 112,
      thumbnailPath: 'assets/ladieswatch.png',
    ),
    Product(
      categoryName: 'Beauty',
      name: 'Cotton Shirt',
      description: 'This is 100% cotton shirt which is made by Bangladesh',
      originalPrice: 150,
      discountPrice: 112,
      thumbnailPath: 'assets/cottonshirt2.png',
    ),
  ];

  String? _selectedCategoryName;
  String _searchedProductText = '';

  final pageBoxShadow = [
    BoxShadow(
      color: Colors.black.withAlpha(47),
      blurRadius: 4.0,
      offset: const Offset(0.0, 1.0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _products.where((product) {
      final isMatchCategory = _selectedCategoryName == null ||
          product.categoryName == _selectedCategoryName;

      final trimmedSearch = _searchedProductText.trim();
      final isMatchSearch = trimmedSearch.isEmpty ||
          product.name.toLowerCase().contains(trimmedSearch);

      return isMatchCategory && isMatchSearch;
    });

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        /* searchbar */
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: pageBoxShadow,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            children: [
              const Icon(Icons.search),
              const SizedBox(width: 8.0),
              Container(
                width: 1.0,
                height: 20.0,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchedProductText = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search Your Product',
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32.0),
        /* category */
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Category',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategoryName = null;
                });
              },
              child: const Text('See All'),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _categories.map((category) {
            return _Category(
              category: category,
              isActive: category.name == _selectedCategoryName,
              onTap: () {
                setState(() {
                  _selectedCategoryName = category.name;
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 24.0),
        /* the actual list */
        filteredProducts.isEmpty
            ? const Text(
                'No products for current filter',
                textAlign: TextAlign.center,
              )
            : const SizedBox(),
        ...filteredProducts.map((product) {
          return Column(
            children: [
              _Product(product: product),
              const SizedBox(height: 24.0),
            ],
          );
        }),
      ],
    );
  }
}

class _Category extends StatelessWidget {
  final Category category;
  final bool isActive;
  final void Function() onTap;

  const _Category({
    required this.category,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final categoryBoxShadow = [
      BoxShadow(
        color: Colors.black.withAlpha(47),
        blurRadius: 4.0,
        offset: const Offset(0.0, 1.0),
      ),
    ];

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surface,
              boxShadow: categoryBoxShadow,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Image.asset(
              category.imagePath,
              width: 40.0,
              height: 40.0,
              color: isActive ? Colors.white : null,
              filterQuality: FilterQuality.medium,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(category.name, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
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
        Icon(
          icon,
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.tertiary,
        ),
        Text(text, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _Product extends StatelessWidget {
  final Product product;

  const _Product({required this.product});

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
            width: 128.0,
            height: 128.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(product.thumbnailPath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  product.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${product.originalPrice}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            decoration: TextDecoration.lineThrough,
                            decorationColor:
                                Theme.of(context).colorScheme.tertiary,
                            height: 1.25,
                          ),
                        ),
                        Text(
                          '\$${product.discountPrice}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.primary,
                            height: 1.25,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Color'),
                        const SizedBox(height: 2.0),
                        Row(
                          children: [
                            Colors.blue,
                            Colors.red,
                            Colors.yellow,
                          ].map((color) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: 14.0,
                                height: 14.0,
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
