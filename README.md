
## date_picker_widget
### custom cupertino date picker widget.




## Installation

Add slide_up to your pubspec.yaml dependencies. And import it:

```bash
  date_picker_widget: ^0.0.1
```
    
## How to use #

Simply create a SlideUp widget, and pass the required params:

```bash
    CustomTimePicker(
            is24Hours: false,
            height: 200,
            width: size.width,
            initialDate: TimeOfDay.now(),
            onTimeSelected: (time) {
              print(time);
            },
          )
```


## Params

```dart
  final Function(TimeOfDay) onTimeSelected;
  final TimeOfDay initialDate;
  final double width;
  final double height;
  final bool is24Hours; // default is false
  final Decoration lineDecoration;
  final Decoration? decoration;
  final TextStyle textStyle;
```
## Example
```dart
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
```

## Screenshots

![App Screenshot](https://github.com/praveen576232/date_picker-widget/blob/main/screenshots/preview.gif?raw=true)


## Badges


[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)


