import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('Build start');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider package tutorial'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
