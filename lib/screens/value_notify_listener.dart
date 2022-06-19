import 'dart:developer';

import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({Key? key}) : super(key: key);
// making stateless widget as stateful widget with provider with ValueNotifier
//ValueNotifier extends ChangeNotifier
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    log('Build on with valuenotifier');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notify Listener'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // this value is provided by getter stated in ValueNotifier
          // all of this works like a normal provider system i.e. backend code is already done .
          _counter.value++;
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
          //instead of consumer, we use ValueListenableBuilder to call the functions.
          child: ValueListenableBuilder(
        valueListenable: _counter,
        builder: (context, value, child) {
          return Text(_counter.value.toString());
        },
      )),
    );
  }
}
