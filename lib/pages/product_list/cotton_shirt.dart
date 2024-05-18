import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task_archive/types.dart';

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
                  'This is 100% inclusive cotton shirt',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 24.0),
                const _Pictures(),
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
                const _ColorPicker(),
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

class _Pictures extends StatefulWidget {
  const _Pictures();

  @override
  State<_Pictures> createState() => _PicturesState();
}

class _PicturesState extends State<_Pictures> {
  final List<String> images = [
    'assets/ladieswatch.png',
    'assets/cottonshirt.png',
    'assets/cottonshirt2.png',
  ];
  final _picturesController = PageController(
    viewportFraction: 0.8,
    initialPage: 1,
  );

  int _currentPage = 1;

  @override
  void dispose() {
    _picturesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.0,
      child: PageView(
        scrollBehavior: const _PicturesScrollBehavior(),
        controller: _picturesController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: images
            .map((image) => _Picture(
                  imagePath: image,
                  isActive: images.indexOf(image) == _currentPage,
                ))
            .toList(),
      ),
    );
  }
}

class _PicturesScrollBehavior extends MaterialScrollBehavior {
  const _PicturesScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices =>
      super.dragDevices.union({PointerDeviceKind.mouse});
}

class _Picture extends StatelessWidget {
  final String imagePath;
  final bool isActive;

  const _Picture({required this.imagePath, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
      padding: EdgeInsets.symmetric(
        horizontal: isActive ? 0.0 : 16.0,
        vertical: isActive ? 0.0 : 16.0,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
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
    );
  }
}

class _ColorPicker extends StatefulWidget {
  const _ColorPicker();

  @override
  State<_ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<_ColorPicker> {
  final List<ColorData> colors = const [
    ColorData(name: 'Red', color: Colors.red),
    ColorData(name: 'Orange', color: Colors.orange),
    ColorData(name: 'Yellow', color: Colors.yellow),
    ColorData(name: 'Green', color: Colors.green),
    ColorData(name: 'Blue', color: Colors.blue),
    ColorData(name: 'Indigo', color: Colors.indigo),
    ColorData(name: 'Violet', color: Colors.purple),
  ];

  String chosenColor = 'Red';

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Text(chosenColor),
          ],
        ),
        Row(
          children: colors.map((color) {
            return _Color(
                colorData: color,
                isActive: color.name == chosenColor,
                onTap: () {
                  setState(() {
                    chosenColor = color.name;
                  });
                });
          }).toList(),
        ),
      ],
    );
  }
}

class _Color extends StatelessWidget {
  final ColorData colorData;
  final bool isActive;
  final void Function() onTap;

  const _Color({
    required this.colorData,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.decelerate,
          width: isActive ? 24.0 : 18.0,
          height: isActive ? 24.0 : 18.0,
          color: colorData.color,
          child: isActive
              ? const Icon(Icons.check, color: Colors.white, size: 16.0)
              : null,
        ),
      ),
    );
  }
}
