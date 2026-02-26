import 'package:flutter/material.dart';

class SlantedIndicator extends Decoration {
  final Color color;
  final double slant;
  final double height;

  const SlantedIndicator({
    required this.color,
    this.slant = 22,
    this.height = 40,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _SlantedPainter(color, slant, height);
  }
}

class _SlantedPainter extends BoxPainter {
  final Color color;
  final double slant;
  final double height;

  _SlantedPainter(this.color, this.slant, this.height);

  @override
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration config) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final extra = slant * 2;
    final w = config.size!.width + extra;
    final h = height;

    final left = offset.dx - extra / 2;
    final right = left + w;
    final bottom = offset.dy + config.size!.height;
    final top = bottom - h;

    final path = Path()
      ..moveTo(left + slant, top)
      ..lineTo(right, top)
      ..lineTo(right - slant, bottom)
      ..lineTo(left, bottom)
      ..close();

    canvas.drawPath(path, paint);
  }

}

