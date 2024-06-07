import 'package:flutter/material.dart';
import 'package:flutter_task_archive/types.dart';

class CartPage extends StatelessWidget {
  final List<CartItem> cart;
  final void Function(int) onRemoveProduct;

  const CartPage(this.cart, {super.key, required this.onRemoveProduct});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink).copyWith(
          primary: const Color(0xFFF35770),
          tertiary: const Color(0xFF999999),
          tertiaryContainer: const Color(0xFFE0E0E0),
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
      child: CartPageContent(cart, onRemoveProduct: onRemoveProduct),
    );
  }
}

class CartPageContent extends StatefulWidget {
  final List<CartItem> cart;
  final void Function(int) onRemoveProduct;

  const CartPageContent(this.cart, {super.key, required this.onRemoveProduct});

  @override
  State<CartPageContent> createState() => _CartPageContentState();
}

class _CartPageContentState extends State<CartPageContent> {
  void removeProductFromCart(int idx) {
    widget.onRemoveProduct(idx);
    setState(() {
      widget.cart;
    });
  }

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
        title: const Text('Cart'),
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
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Text('Your cart contains (${widget.cart.length} items):'),
                ...widget.cart.asMap().entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name: ${entry.value.product.name}'),
                            Text('Qty: ${entry.value.qty}'),
                            Text('Color: ${entry.value.color}'),
                          ],
                        ),
                        TextButton(
                          onPressed: () => removeProductFromCart(entry.key),
                          child: const Text('Remove'),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: pageBoxShadow,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _FooterItem(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  isActive: false,
                  onTap: () => Navigator.of(context).pop(),
                ),
                const _FooterItem(
                  icon: Icons.shopping_cart_outlined,
                  text: 'Cart',
                  isActive: true,
                ),
                const _FooterItem(
                  icon: Icons.favorite_outline,
                  text: 'Favorite',
                  isActive: false,
                ),
                const _FooterItem(
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

class _FooterItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isActive;
  final void Function()? onTap;

  const _FooterItem({
    required this.icon,
    required this.text,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.tertiary,
          ),
          Text(text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
