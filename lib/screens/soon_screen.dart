import 'package:flutter/material.dart';

class SoonScreen extends StatelessWidget {
  const SoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(scrolledUnderElevation: 0, backgroundColor: Colors.white),
      body: Center(child: Text('Soon..')),
    );
  }
}
