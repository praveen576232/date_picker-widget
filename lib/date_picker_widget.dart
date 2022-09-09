library date_picker_widget;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTimePicker extends StatelessWidget {
  const CustomTimePicker(
      {Key? key,
      required this.onTimeSelected,
      required this.initialDate,
      required this.height,
      required this.width,
      this.is24Hours = false,
      this.lineDecoration = const BoxDecoration(color: Colors.grey),
      this.decoration,
      this.textStyle = const TextStyle(
          color: Colors.black, fontSize: 26, fontWeight: FontWeight.w600)})
      : super(key: key);
  final Function(TimeOfDay) onTimeSelected;
  final TimeOfDay initialDate;
  final double width;
  final double height;
  final bool is24Hours;
  final Decoration lineDecoration;
  final Decoration? decoration;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    int hour = initialDate.hour;
    int minute = initialDate.minute;
    bool isAm = initialDate.period == DayPeriod.am;
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: CupertinoTheme(
        data: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
          pickerTextStyle: textStyle,
        )),
        child: Row(
          children: [
            Expanded(
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: hour - 1),
                  selectionOverlay:
                      const CupertinoPickerDefaultSelectionOverlay(
                    background: Colors.transparent,
                  ),
                  looping: true,
                  itemExtent: 30,
                  magnification: 1,
                  squeeze: .5,
                  diameterRatio: 5.5,
                  onSelectedItemChanged: (h) {
                    hour = h;
                    if (is24Hours) {
                      onTimeSelected(TimeOfDay(hour: hour + 1, minute: minute));
                    } else {
                      onTimeSelected(TimeOfDay(
                          hour: isAm ? hour + 1 : hour + 13, minute: minute));
                    }
                  },
                  children: List.generate(
                      is24Hours ? 24 : 12, (index) => Text("${index + 1}"))),
            ),
            _line,
            Expanded(
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: minute),
                  selectionOverlay:
                      const CupertinoPickerDefaultSelectionOverlay(
                          background: Colors.transparent),
                  looping: true,
                  itemExtent: 30,
                  magnification: 1,
                  squeeze: .5,
                  diameterRatio: 5.5,
                  onSelectedItemChanged: (m) {
                    minute = m;
                    if (is24Hours) {
                      onTimeSelected(TimeOfDay(hour: hour + 1, minute: m));
                    } else {
                      onTimeSelected(TimeOfDay(
                          hour: isAm
                              ? hour + 1
                              : (hour + 13) == 24
                                  ? minute > 0
                                      ? 0
                                      : (hour + 13)
                                  : (hour + 13),
                          minute: m));
                    }
                  },
                  children: List.generate(60, (index) => Text("$index"))),
            ),
            if (!is24Hours) _line,
            if (!is24Hours)
              Expanded(
                child: CupertinoPicker(
                    scrollController:
                        FixedExtentScrollController(initialItem: isAm ? 0 : 1),
                    selectionOverlay:
                        const CupertinoPickerDefaultSelectionOverlay(
                            background: Colors.transparent),
                    itemExtent: 30,
                    magnification: 1,
                    squeeze: .5,
                    diameterRatio: 5.5,
                    onSelectedItemChanged: (i) {
                      if (i == 0) {
                        isAm = true;
                        onTimeSelected(
                            TimeOfDay(hour: hour + 1, minute: minute));
                      } else {
                        isAm = false;
                        onTimeSelected(
                            TimeOfDay(hour: hour + 13, minute: minute));
                      }
                    },
                    children: const [Text("AM"), Text("PM")]),
              )
          ],
        ),
      ),
    );
  }

  Widget get _line => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: DecoratedBox(
          decoration: lineDecoration,
          child: const SizedBox(
            width: 1,
            height: double.infinity,
          ),
        ),
      );
}
