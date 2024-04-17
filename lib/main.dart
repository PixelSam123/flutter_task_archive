import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_task_archive/pages/home.dart';
import 'package:window_size/window_size.dart';

const _title = 'Flutter Task Archive';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await setupDesktopWindow();
  }

  runApp(const MyApp());
}

Future<void> setupDesktopWindow() async {
  final windowFrame = (await getWindowInfo()).frame;
  final screenSize = (await getCurrentScreen())?.frame.size;

  setWindowTitle(_title);

  if (screenSize != null && screenSize.width >= 2560) {
    setWindowMinSize(const Size(600, 800));
    setWindowFrame(
      Rect.fromLTWH(windowFrame.left, windowFrame.top, 600, 800),
    );
  } else {
    setWindowMinSize(const Size(400, 600));
    setWindowFrame(
      Rect.fromLTWH(windowFrame.left, windowFrame.top, 400, 600),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
      ),
      home: HomePage(),
    );
  }
}
