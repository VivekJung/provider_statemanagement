import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final data;
  const DetailScreen({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Text(data.toString())),
          Center(child: Text(data.toString())),
        ],
      ),
    );
  }
}
