import 'package:flutter/material.dart';

import '../widgets/custom_range_slider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 49, 59, 77),
        title: const Text(
          "Custom Range Slider",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 2.0,
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 150),
            child: CustomRangeSlider(),
          ),
        ],
      ),
    );
  }
}
