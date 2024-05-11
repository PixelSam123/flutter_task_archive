import 'package:flutter/widgets.dart';

class FakeDevicePixelRatio extends StatelessWidget {
  final double? fakeDevicePixelRatio;
  final Widget child;

  const FakeDevicePixelRatio({
    super.key,
    this.fakeDevicePixelRatio,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final realRatio = View.of(context).devicePixelRatio;
    final calculatedRatio = (fakeDevicePixelRatio ?? realRatio) / realRatio;

    return FractionallySizedBox(
      widthFactor: 1.0 / calculatedRatio,
      heightFactor: 1.0 / calculatedRatio,
      child: Transform.scale(scale: calculatedRatio, child: child),
    );
  }
}
