import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

// CustomThumbShape is a custom thumb shape for a Slider.
class CustomThumbShape extends SfThumbShape {
  final double thumbRadius;
  final int min;
  final int max;
  final double startValue;
  final double endValue;

  // Constructor to initialize the custom thumb shape.
  CustomThumbShape({
    required this.thumbRadius,
    this.min = 0,
    this.max = 100,
    required this.startValue,
    required this.endValue,
  });

  // Get the slider color based on the value.
  Color _getSliderColor(double value) {
    // Define color stops and colors for gradient.
    final colorStops = [0.0, 0.3, 0.7, 1.0];
    final colors = [
      Colors.lightBlue[500]!.withAlpha(100),
      Colors.lightBlue[200]!.withAlpha(100),
      Colors.red[200]!.withAlpha(100),
      Colors.red[600]!.withAlpha(100),
    ];

    // Normalize the value between 0 and 1.
    final colorValue = (value / 100).clamp(0.0, 1.0);

    // Calculate the index and interpolation value.
    final lerpValue = (colorStops.length - 1) * colorValue;
    final startIndex = lerpValue.floor();
    final endIndex = lerpValue.ceil();

    if (startIndex == endIndex) {
      return colors[startIndex];
    }

    final startColor = colors[startIndex];
    final endColor = colors[endIndex];
    final t = lerpValue - startIndex.toDouble();

    return Color.lerp(startColor, endColor, t)!;
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
      required RenderBox? child,
      required SfSliderThemeData themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Paint? paint,
      required Animation<double> enableAnimation,
      required TextDirection textDirection,
      required SfThumb? thumb}) {
    final Canvas canvas = context.canvas;
    final color = thumb == SfThumb.start
        ? _getSliderColor(startValue)
        : _getSliderColor(endValue);

    // Define paint for the thumb.
    final thumbPaint = Paint()
      ..color = color // Thumb Background Color
      ..style = PaintingStyle.fill;

    // Create a custom path for the hexagon.
    final path = Path();
    for (int i = 0; i < 6; i++) {
      double angle = pi / 6 + pi / 3.0 * i;
      double x = center.dx + thumbRadius * 0.9 * cos(angle);
      double y = center.dy + thumbRadius * 0.9 * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    // Draw the hexagon-shaped thumb.
    canvas.drawPath(path, thumbPaint);

    // Paint the range value text on the thumb.
    final valueText =
        thumb == SfThumb.start ? getValue(startValue) : getValue(endValue);

    final textSpan = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius * 0.6,
        fontWeight: FontWeight.w700,
        color: Colors.black, // Text Color of Value on Thumb
      ),
      text: valueText,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: textDirection,
    );
    textPainter.layout();
    final textCenter = Offset(center.dx - (textPainter.width / 2),
        center.dy - (textPainter.height / 2));
    textPainter.paint(canvas, textCenter);
  }

  // Convert the value to a rounded string.
  String getValue(double value) {
    return (value).round().toString();
  }

  @override
  Size getPreferredSize(SfSliderThemeData themeData) {
    return Size.fromRadius(themeData.thumbRadius);
  }
}
