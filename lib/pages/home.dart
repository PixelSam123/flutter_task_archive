import 'package:flutter/material.dart';
import 'package:flutter_task_archive/pages/discover.dart';
import 'package:flutter_task_archive/pages/product_list/index.dart';
import 'package:flutter_task_archive/pages/watch.dart';
import 'package:flutter_task_archive/pages/x_beauty.dart';

class _PageInfo {
  final String title;
  final String? imageDir;
  final Widget page;

  _PageInfo({required this.title, this.imageDir, required this.page});
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<_PageInfo> _pages = [
    _PageInfo(
      title: 'X Beauty',
      imageDir: 'assets/x beauty.png',
      page: const XBeautyPage(),
    ),
    _PageInfo(
      title: 'Madison Watch',
      imageDir: 'assets/watch.png',
      page: const WatchPage(),
    ),
    _PageInfo(
      title: 'Discover',
      imageDir: 'assets/discover.png',
      page: const DiscoverPage(),
    ),
    _PageInfo(
      title: 'Product List',
      imageDir: 'assets/productlist.jpg',
      page: const ProductListPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        title: const Text('Flutter Task Archive'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 512.0),
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Text(
                'Page List:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 12.0),
              ..._pages
                  .expand((page) => [
                        _Page(page: page),
                        const SizedBox(height: 12.0),
                      ])
                  .toList()
                  .sublist(0, _pages.length * 2 - 1),
            ],
          ),
        ),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final _PageInfo page;

  const _Page({required this.page});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            page.imageDir != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      page.imageDir!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 8.0),
            Text(
              page.title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => page.page),
                );
              },
              child: const Text('Open'),
            ),
          ],
        ),
      ),
    );
  }
}
