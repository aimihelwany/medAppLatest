import 'package:flutter/material.dart';

class DosePick extends StatefulWidget {
  @override
  _DosePickState createState() => _DosePickState();
}

class _DosePickState extends State<DosePick> {
  String dropdownValue = '1';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: ListTile(
            title: Text('Dose : '),
          ),
        ),
        DropdownButton<String>(
          hint: Text('Dose'),
          value: dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['1', '2', '3', '4'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
