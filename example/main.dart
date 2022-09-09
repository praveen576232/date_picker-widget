import 'package:date_picker_widget/date_picker_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Screen2(),
  ));
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          CustomTimePicker(
            is24Hours: false,
            height: 200,
            width: size.width,
            initialDate: TimeOfDay.now(),
            onTimeSelected: (time) {
              print(time);
            },
          )
        ],
      ),
    );
  }
}
