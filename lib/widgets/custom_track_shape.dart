import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// CustomSliderTrackShape is a custom track shape for a Slider.
class CustomSliderTrackShape extends SfTrackShape {
  // customTrackHeight specifies the custom track height.
  final double customTrackHeight;

  // Constructor to initialize the custom track height.
  CustomSliderTrackShape({required this.customTrackHeight});

  @override
  void paint(PaintingContext context, Offset offset, Offset? thumbCenter,
      Offset? startThumbCenter, Offset? endThumbCenter,
      {required RenderBox parentBox,
      required SfSliderThemeData themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Animation<double> enableAnimation,
      required Paint? inactivePaint,
      required Paint? activePaint,
      required TextDirection textDirection}) {
    // Calculate the dimensions and appearance of the custom track.

    // Use the custom track height here.
    final double trackHeight = customTrackHeight;

    // Calculate the width of the track.
    final double trackWidth = parentBox.size.width - 40;

    // Adjust this value to your needs for the track offset from the edges.
    const double trackOffset = 20;

    // Define the rectangle for the custom track.
    final Rect trackRect = Rect.fromPoints(offset.translate(trackOffset, -2),
        offset.translate(trackWidth + trackOffset, trackHeight));

    // Create a rounded rectangle for the track.
    final RRect roundedTrackRect =
        RRect.fromRectAndRadius(trackRect, const Radius.circular(15));

    // Create a paint object for drawing the track.
    final Paint paint = Paint();

    // Create a linear gradient for the track's fill.
    paint.shader = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.lightBlue[500]!,
        Colors.lightBlue[200]!,
        Colors.red[200]!,
        Colors.red[600]!
      ],
      stops: const [0.0, 0.3, 0.7, 1.0],
    ).createShader(trackRect);

    // Draw the custom track with the defined paint.
    context.canvas.drawRRect(roundedTrackRect, paint);
  }
}
