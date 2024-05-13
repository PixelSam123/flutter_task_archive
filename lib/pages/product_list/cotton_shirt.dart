import 'package:flutter/material.dart';

class CottonShirtPage extends StatelessWidget {
  const CottonShirtPage({super.key});

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
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      ),
      child: const CottonShirtPageContent(),
    );
  }
}

class CottonShirtPageContent extends StatelessWidget {
  const CottonShirtPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('Product Details'),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Text(
                  'Cotton Shirt',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'This is 100% cotton shirt',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 24.0),
                /* picture */
                Container(
                  width: double.infinity,
                  height: 240.0,
                  padding: const EdgeInsets.all(12.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/productlist.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(47),
                          blurRadius: 4.0,
                          offset: const Offset(0.0, 1.0),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Theme.of(context).colorScheme.primary,
                      size: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                /* price */
                Row(
                  children: [
                    Text(
                      '\$112',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      '\$150',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Theme.of(context).colorScheme.tertiary,
                        height: 1.25,
                      ),
                    ),
                    const Spacer(),
                    const Text('5 in stock'),
                  ],
                ),
                const SizedBox(height: 24.0),
                /* description */
                Text(
                  'Description',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'This is 100% cotton shirt which This is 100% cotton wear '
                  'shirt which is made by Bangladesh is made by this by '
                  'Bangladesh dummy text',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 24.0),
                /* choose colors */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Colors',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        const Text('Light Sky'),
                      ],
                    ),
                    Row(
                      children: [
                        Colors.blue,
                        Colors.red,
                        Colors.yellow,
                      ].map((color) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: Container(
                            width: color == Colors.blue ? 24.0 : 20.0,
                            height: color == Colors.blue ? 24.0 : 20.0,
                            color: color,
                            child: color == Colors.blue
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 12.0,
                                  )
                                : null,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: const Text(
                      'ADD TO CART',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      'BUY NOW',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
