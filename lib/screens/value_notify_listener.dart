import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({Key? key}) : super(key: key);
// making stateless widget as stateful widget with provider with ValueNotifier
//ValueNotifier extends ChangeNotifier
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toogle = ValueNotifier<bool>(true);

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
          //the value is '0'. this is provided above.
          _counter.value++;
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: toogle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: toogle.value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: InkWell(
                      onTap: () async {
                        toogle.value = !toogle.value;
                        log('toggle value: ${toogle.value}');

                        log('toggle value: ${toogle.value}');
                      },
                      child: Icon(
                        toogle.value
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                );
              }),
          Center(
              //instead of consumer, we use ValueListenableBuilder to call the functions.
              child: ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text(_counter.value.toString());
            },
          )),
        ],
      ),
    );
  }
}
