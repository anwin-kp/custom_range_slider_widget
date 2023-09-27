import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';



import 'custom_thumb.dart';
import 'custom_track_shape.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({Key? key}) : super(key: key);

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  double _startValue = 20.0;
  double _endValue = 80.0;

  @override
  Widget build(BuildContext context) {
    return SfSliderTheme(
      data:
          SfSliderThemeData(labelOffset: Offset.zero, tickOffset: Offset.zero),
      child: SfRangeSlider(
        min: 0.0,
        max: 100.0,
        values: SfRangeValues(_startValue, _endValue),
        onChanged: (SfRangeValues values) {
          setState(() {
            _startValue = values.start;
            _endValue = values.end;
          });
        },
        inactiveColor: const Color.fromARGB(255, 162, 225, 255),
        activeColor: const Color.fromARGB(255, 162, 225, 255),
        enableTooltip: false,
        trackShape: CustomSliderTrackShape(customTrackHeight: 8),
        thumbShape: CustomThumbShape(
            thumbRadius: 20.0, // Adjust the thumb size as needed
            min: 0,
            max: 100,
            startValue: _startValue,
            endValue: _endValue),
      ),
    );
  }
}
