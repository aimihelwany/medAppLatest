import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => _TimePickerState();
}

const MaterialColor _buttonTextColor = MaterialColor(0xFFC41A3B, <int, Color>{
  50: Color(0xFFC41A3B),
  100: Color(0xFFC41A3B),
  200: Color(0xFFC41A3B),
  300: Color(0xFFC41A3B),
  400: Color(0xFFC41A3B),
  500: Color(0xFFC41A3B),
  600: Color(0xFFC41A3B),
  700: Color(0xFFC41A3B),
  800: Color(0xFFC41A3B),
  900: Color(0xFFC41A3B),
});

class _TimePickerState extends State<TimePicker> {
  String title = 'Time Picker';
  TimeOfDay _time;

  @override
  void initState() {
    super.initState();
    _time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Time : ${_time.hour}:${_time.minute}'),
      trailing: Icon(Icons.timer),
      onTap: _pickTime,
    );
  }

  _pickTime() async {
    TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: _time,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
              primaryColor: Color(0xFFC41A3B),
              accentColor: Color(0xFFC41A3B),
              primarySwatch: _buttonTextColor,
            ),
            child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: child,
                )),
          );
        });

    if (time != null)
      setState(() {
        _time = time;
      });
  }
}
