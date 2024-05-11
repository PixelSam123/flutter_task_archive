import 'package:flutter/widgets.dart';

class FakeDevicePixelRatio extends StatelessWidget {
  final double fakeDevicePixelRatio;
  final Widget child;

  const FakeDevicePixelRatio({
    super.key,
    required this.fakeDevicePixelRatio,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = fakeDevicePixelRatio / View.of(context).devicePixelRatio;

    return FractionallySizedBox(
      widthFactor: 1.0 / ratio,
      heightFactor: 1.0 / ratio,
      child: Transform.scale(scale: ratio, child: child),
    );
  }
}
