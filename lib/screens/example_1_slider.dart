import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider_tutorial/provider/example_1_slider.dart';

//Provider with Slider widget
class Example1 extends StatefulWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  @override
  Widget build(BuildContext context) {
    // if you are using consumer widget then there is no need to call provider here
    // final provider =
    //     Provider.of<ExampleOneSliderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider example'),
      ),
      body: Consumer<ExampleOneSliderProvider>(
        builder: ((context, value, child) {
          //value is the value we get by calling provider.
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                min: 0,
                max: 1,
                divisions: 10,
                label: "Opacity${value.value}",
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.green.withOpacity(value.value),
                      child: const Center(
                        child: Text('1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.value),
                      child: const Center(
                        child: Text('2'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
