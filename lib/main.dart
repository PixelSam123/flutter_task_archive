import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_task_archive/fake_device_pixel_ratio.dart';
import 'package:flutter_task_archive/pages/home.dart';
import 'package:window_size/window_size.dart';

const _title = 'Flutter Task Archive';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await setupDesktopWindow();
  }

  runApp(FakeDevicePixelRatio(
    fakeDevicePixelRatio: Platform.isMacOS
        ? 2.25
        : Platform.isLinux
            ? await linuxDevicePixelRatio()
            : null,
    child: const MyApp(),
  ));
}

Future<void> setupDesktopWindow() async {
  final windowFrame = (await getWindowInfo()).frame;
  final screenSize = (await getCurrentScreen())?.frame.size;

  setWindowTitle(_title);

  if (screenSize != null) {
    final (w, h) = screenSize.width > 2560
        ? (648.0, 1152.0)
        : screenSize.width > 1920
            ? (504.0, 896.0)
            : (396.0, 704.0);

    setWindowMinSize(Size(w, h));
    setWindowFrame(Rect.fromLTWH(windowFrame.left, windowFrame.top, w, h));
  }
}

Future<double> linuxDevicePixelRatio() async {
  final screenSize = (await getCurrentScreen())?.frame.size;
  if (screenSize == null) {
    return 1.0;
  }

  if (screenSize.width > 2560) {
    return 1.75;
  }
  if (screenSize.width > 1920) {
    return 1.25;
  }

  return 1.0;
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
