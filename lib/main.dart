import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider_tutorial/provider/count_provider.dart';
import 'package:state_management_provider_tutorial/provider/example_1_slider.dart';
import 'package:state_management_provider_tutorial/screens/count_example.dart';
import 'package:state_management_provider_tutorial/screens/example_1_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExampleOneSliderProvider()),
        ChangeNotifierProvider(create: (_) => CountProvider()),
      ],
      child: MaterialApp(
        title: 'Provider StateManagement',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Example1(),
      ),
    );
  }
}
