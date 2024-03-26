import 'package:flutter/material.dart';
import 'package:flutter_task_archive/pages/watch.dart';
import 'package:flutter_task_archive/pages/x_beauty.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        title: const Text('Flutter Task Archive'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Page List:'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => XBeautyPage()),
                );
              },
              child: const Text('X BEAUTY'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WatchPage()),
                );
              },
              child: const Text('WATCH'),
            ),
          ],
        ),
      ),
    );
  }
}
